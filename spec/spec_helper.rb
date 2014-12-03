require 'bundler/setup'
Bundler.setup

require 'snails'
require 'rack/test'
require 'pry'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include Rack::Test::Methods
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.warnings = true

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end
end
