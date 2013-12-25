########################################
#                                      #
#       Important Note                 #
#                                      #
#   When running calabash-ios tests at #
#   www.xamarin.com/test-cloud         #
#   this file will be overwritten by   #
#   a file which automates             #
#   app launch on devices.             #
#                                      #
#   Don't rely on this file being      #
#   present when running at            #
#   Xamarin Test Cloud                 #
#                                      #
########################################

require 'calabash-cucumber/launcher'


#APP_BUNDLE_PATH="/Users/hunglv/Library/Application Support/iPhone Simulator/6.1/Applications/6B490FD7-C811-40D0-8A3A-A25B5F31274D/Prism Sales.app"
# You may uncomment the above to overwrite the APP_BUNDLE_PATH
# However the recommended approach is to let Calabash find the app itself
# or set the environment variable APP_BUNDLE_PATH

#SDK_VERSION=6.1
#RESET_BETWEEN_SCENARIOS=1

Before do |scenario|
  @calabash_launcher = Calabash::Cucumber::Launcher.new
  unless @calabash_launcher.calabash_no_launch?
    @calabash_launcher.relaunch
    @calabash_launcher.calabash_notify(self)
  end
end

After do |scenario|
  unless @calabash_launcher.calabash_no_stop?
    calabash_exit
    if @calabash_launcher.active?
      @calabash_launcher.stop
    end
  end
end

at_exit do
  launcher = Calabash::Cucumber::Launcher.new
  if launcher.simulator_target?
    Calabash::Cucumber::SimulatorHelper.stop unless launcher.calabash_no_stop?
  end
end
