# coding: utf-8

require 'selenium-webdriver'
#require 'date'

Dir.glob('spec/**/*steps.rb') { |f| load(f, true) }

=begin
Dir[File.join(File.dirname(__FILE__), "..", "config", "**/*.rb")].each { |f| require f }
Dir[File.join(File.dirname(__FILE__), "..", "lib", "**/*.rb")].each { |f| require f }

# if you would like to use factorygirl
#config.before(:all) do
#  FactoryGirl.reload
#end

# 絶対パスの取得
def absolute_app_path
  file = File.join(File.dirname(__FILE__), APP_PATH)
  raise "App doesn't exist #{file}" unless File.exist? file
  file
end



# tap element
# @param element_name [String] lavel of name
# @param on_driver [Object] Deriver instance object
# @return true
def appium_tap(element_name)
  a = @driver.find_element(name: element_name)
  @driver.execute_script 'mobile: tap', element: a.ref
end

# send keys for target xpath
# @param xpath [String] xpaths
# @param text [String]
# @param on_driver [Object] Deriver instance object
# @return true
def appium_send_keys(xpath, text)
  @driver.find_element(xpath: xpath).send_keys text
end


def save_screenshot_with_05_wait_in(path)
  sleep 0.5
  @driver.save_screenshot("#{path}")
end



def appium_wait_until_displayed?(name)
  @driver_wait.until { @driver.find_element(name: name).displayed? }
end
=end
