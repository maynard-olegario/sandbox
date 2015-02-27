require 'capybara/cucumber'
require 'capybara/poltergeist'

$maxWaitTime                   = 180
Capybara.app_host              = ENV['BDD_TARGET_URL'] || 'http://127.0.0.1:9000'
Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, :js_errors => false, :timeout => $maxWaitTime, :phantomjs_options => ['--ignore-ssl-errors=yes'])
end
Capybara.javascript_driver = Capybara.default_driver = :poltergeist
