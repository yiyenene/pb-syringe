require "bundler/setup"
require "pb_syringe"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

class StubProgressUnit < PbSyringe::ProgressUnit
  def initialize
    @start_called = 0
    @current = 0
    @increment_called = 0
    @finish_called = 0
  end

  attr_reader :start_called, :start_options, :current, :increment_called, :finish_called

  def start(**options)
    @start_called += 1
    @start_options = options
  end

  def increment(count)
    @current += count
    @increment_called += 1
  end

  def finish
    @finish_called += 1
  end
end
