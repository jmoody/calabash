module Calabash
  module Android
    TEST_SERVER_CODE_PATH = File.join(File.dirname(__FILE__), '..', '..', 'android', 'test-server')
    UNSIGNED_TEST_SERVER_APK = File.join(File.dirname(__FILE__), 'android', 'lib', 'TestServer.apk')

    require 'calabash'
    require 'calabash/android/environment'

    # Include old methods
    require_old File.join('ruby-gem', 'lib', 'calabash-android')
    include Calabash::Android::Operations

    include Calabash

    require 'calabash/android/build'
  end
end