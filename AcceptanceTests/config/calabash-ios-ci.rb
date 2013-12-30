#!/usr/bin/env ruby

app_path = ARGV[0]
sdk_version = ARGV[1] || '6.1'
ios_device = ARGV[2] || 'iphone' || 'ipad'
connect_timeout = 30
if ios_device == 'iphone'
  cucumber_tags = '--tags @iphone,~@ipad'
else
  cucumber_tags = '--tags @ipad,~@iphone'
end
log_file = "cucumber-#{sdk_version}-#{ios_device}.json"

system("SDK_VERSION=#{sdk_version} DEVICE='#{ios_device}' APP_BUNDLE_PATH='#{app_path}' CONNECT_TIMEOUT=#{connect_timeout} RESET_BETWEEN_SCENARIOS=1 cucumber --format json -o #{log_file} #{cucumber_tags}")