require 'rubygems'
require "sauce"
require "sauce/capybara"
require "pry"
require 'rspec'
require 'rspec/expectations'

include RSpec::Matchers

# Set up configuration
Sauce.config do |c|
  c[:browsers] = [ ["Windows 7", "Firefox", "20"] ]
end

driver = ENV.fetch("CAPYBARA_DRIVER") { "selenium" }
Capybara.default_driver = :"#{driver}"
Capybara.default_wait_time = 20

include Capybara::DSL

visit "https://app.rnfrstqa.com/signup"
expect(page.current_url).to eq("https://app.rnfrstqa.com/signup")

fill_in 'site_url', with: "http://www.google.com"
fill_in 'name', with: "Capybara Ninja"
fill_in 'email', with: "simon+selenium+#{Time.now.to_i}@rainforestqa.com"
fill_in 'password', with: "password"
click_button 'Sign Up'

find(".tour")

expect(page.current_url).to eq("https://app.rnfrstqa.com/tests/")

