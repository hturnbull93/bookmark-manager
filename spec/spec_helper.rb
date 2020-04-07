ENV['ENVIRONMENT'] = 'test'

require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

require File.join(File.dirname(__FILE__), '..', 'app.rb')
Capybara.app = BookmarkManager

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mAre you already great!\e[0m"
    puts "\e[33mI think so!\e[0m"
  end
end
