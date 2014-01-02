<h1>Outline</h1>

This article explains the set up of a Continuous Integration (CI) environment for Xcode projects that use Kiwi to implement unit tests, Calabash with Cucumber for acceptance tests and finally archive IPA file for distribution.<br>
This is the instruction with my own experience

<h2>1. Run unit tests with Kiwi</h2>
You can read this article for more details how to run Kiwi tests for project.<br>
http://9elements.com/io/index.php/continuous-integration-of-ios-projects-using-jenkins-cocoapods-and-kiwi/
<br>
However, I want to mention that you should modify the build script in unit tests target to increase timeout for ios-sim launching simulator. By default it's 30 seconds timeout, but it often makes build fail because of Session timeout error. You can see my demo project for details.<br>
Here is my build execute shell in Jenkins for build project and run unit tests with Kiwi<br>

     #!/usr/bin/env bash
     cd DemoJenkins
     source ~/.bash_profile
     bundle install
     bundle exec pod repo update
     bundle exec pod install
     kill_simulator()
    {
         if [[ $(ps axo pid,command | grep "[i]Phone Simulator") ]]; then
              killall "iPhone Simulator"
         fi
    }
    kill_simulator
    xcodebuild -sdk iphonesimulator -workspace DemoJenkins.xcworkspace -scheme CommandLineUnitTests -configuration Debug RUN_APPLICATION_TESTS_WITH_IOS_SIM=YES ONLY_ACTIVE_ARCH=NO clean build 2>&1

<h2>2. Run Acceptance tests with Calabash and Cucumber</h2>
You can read this article for more details how to run acceptance tests with Calabash and Cucumber
<br>
http://blog.watchlaterapp.com//blog/2013/03-Calabash-iOS-Jenkins.html
<br>
But for me, I use config.yml to puts cucumber settings(see AcceptanceTests folder in demo project).<br>
After using these code to build .app file for target *-cal<br>

      #!/usr/bin/env bash
      cd DemoJenkins
      source ~/.bash_profile

      bundle install
      bundle exec pod repo update
      bundle exec pod install
      DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer
      xcodebuild clean build -workspace DemoJenkins.xcworkspace -scheme DemoJenkins-cal -configuration Debug -sdk iphonesimulator DEPLOYMENT_LOCATION=YES DSTROOT=build TARGETED_DEVICE_FAMILY=1 ONLY_ACTIVE_ARCH=NO CONFIGURATION_BUILD_DIR="$WORKSPACE/build"

and then run acceptance test by command lines:

      #!/usr/bin/env bash
      source ~/.bash_profile
      cd AcceptanceTests
      cucumber -p ios features/*.feature

That's all for acceptance tests. You can use cucumber report plugin for reporting test result.<br>

<h2>3. Archive IPA file for distribution</h2>
Finally, we can build IPA file for distribution. I found gem named "shenzhen" for packaging project. It's very easy to use.<br>
https://github.com/nomad/shenzhen
<br>
After installing shenzen successfully, you can use this command to export ipa file and distribute to some host like testflight, amazon, etc... by this command

      ipa build -s DemoJenkins -c Release

