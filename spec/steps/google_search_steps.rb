# coding: utf-8

module GoogleSearch
  step 'test with :device' do |device|
    @device = device
  end

  step 'go to :target_site' do |target_site|
    driver.navigate.to target_site
  end

  step 'input :word in search field' do |word|
    driver.find_element(:id, 'lst-ib').send_keys(word)
  end

  step 'submit form' do
    driver.find_element(:id, 'tsf').submit
  end

  step 'display search page ?' do
    wait = Selenium::WebDriver::Wait.new(timeout: 3)
    expect { wait.until { driver.find_element(:id, 'hdtb_msb') } }.not_to raise_error
  end

  step 'save screenshot :number' do |number|
    SCREENSHOT_SAVE_PATH = "./screenshot".freeze
    FileUtils.mkdir_p(SCREENSHOT_SAVE_PATH) unless FileTest.exist?(SCREENSHOT_SAVE_PATH)
    driver.save_screenshot "#{SCREENSHOT_SAVE_PATH}/#{@device}-#{number}.png"
    cleanup
  end

  def driver
    case @device
      when 'firefox'
        @driver ||= Selenium::WebDriver.for :firefox
      when 'iPhone Simulator'
        @driver ||= Selenium::WebDriver.for(
            :remote,
            desired_capabilities:
                {
                    browserName: '',
                    device: 'iPhone',
                    deviceName: 'iPhone Retina (4-inch)', #only for ios simulator: 'iPhone Retina (3.5-inch)'
                    version: '7.0',
                    app: 'safari'
                },
            url: "http://127.0.0.1:4723/wd/hub"
        )
      when 'android'
        @driver ||= Selenium::WebDriver.for :android
    end
  end

  def cleanup
    driver.quit
    @driver = nil
  end
end

RSpec.configure do |c|
  c.include GoogleSearch
  c.after(:each) do
    cleanup if example.exception
  end
end