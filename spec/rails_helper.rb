ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'devise'
require 'factory_girl_rails'
require 'shoulda/matchers'
require 'capybara/poltergeist'
require 'capybara-screenshot/rspec'
include Warden::Test::Helpers

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!

  config.include FactoryGirl::Syntax::Methods
  config.include Capybara::DSL
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Rails.application.routes.url_helpers
  config.include Warden::Test::Helpers
  config.include FeatureHelpers, type: :feature

  config.before(:all) { FactoryGirl.reload }

  config.before(:suite) { DatabaseCleaner.clean_with :truncation }
  config.before(:each) { DatabaseCleaner.strategy = :transaction }

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end
  config.before(:each) { DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }

  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(
      app,
      phantomjs_logger: Rails.root.join('log', 'poltergeist.log'),
      inspector: true
    )
  end

  Capybara.javascript_driver = :poltergeist
  Capybara.default_max_wait_time = 5
  Capybara.register_server :puma do |app, port|
    require 'puma'
    Puma::Server.new(app).tap do |s|
      s.add_tcp_listener Capybara.server_host, port
    end.run.join
    host = 'http://localhost:3001'
    port = 3001
  end
end
