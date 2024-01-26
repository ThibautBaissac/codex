RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = %i[should expect]
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.syntax = %i[should expect]
    mocks.verify_partial_doubles = true
  end

  config.before(:each, type: :request) do
    host! "localhost:8000"
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.tty = true
  config.color = true
  config.formatter = :documentation
end
