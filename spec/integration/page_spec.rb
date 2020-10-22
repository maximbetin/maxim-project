require 'capybara'
require 'capybara/dsl'
require 'selenium-webdriver'

include Capybara::DSL
Capybara.app_host = "http://#{ENV['WEBSITE_URL']}" # Change to use the ENV variable instead
Capybara.run_server = false # Disable Rack since we are using Selenium
Capybara.register_driver :selenium do |app| # Register Selenium
  Capybara::Selenium::Driver.new(
    app,
    browser: :remote, # Where to look for the browser; for Selenium
    url: "http://#{ENV['SELENIUM_HOST']}:#{ENV['SELENIUM_PORT']}/wd/hub", # The ENV variables are taken from the docker-compose file
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
      "chromeOptions" => {
        "args" => ['--no-default-browser-check']
      }
    )
  )
end

Capybara.default_driver = :selenium # Make Selenium the default

describe "Example page render unit tests" do
  it "Shows the Explore California logo" do
    visit('/')
    expect(page.has_selector? '.logo').to be true # Test if the selector is present
  end
end
