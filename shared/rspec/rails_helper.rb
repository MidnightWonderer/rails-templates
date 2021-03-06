ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'spec_helper'
require 'rspec/rails'
require 'devise'

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "\#{::Rails.root}/spec/fabricators"

  config.use_transactional_fixtures = false

  config.infer_spec_type_from_file_location!

  config.include Rails.application.routes.url_helpers

  # Devise
  config.include Devise::Test::ControllerHelpers, type: :controller
end
