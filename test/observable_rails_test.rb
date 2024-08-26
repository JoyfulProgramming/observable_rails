# frozen_string_literal: true

require "observable_rails"

class TestObservableRailsStructuredError < Minitest::Test
  def setup
    @error_message = "Test error message"
    @error_context = {key: "value"}
    @error = ObservableRails::StructuredError.new(@error_message, context: @error_context)
  end

  def test_returns_the_context_passed_to_the_constructor
    assert_equal @error_context, @error.context
  end

  def test_does_not_include_the_context_in_the_error_message
    assert_equal @error_message, @error.message
  end

  def test_sets_the_message_to_the_pretty_printed_context_using_awesome_print
    error_context = {key1: "value1", key2: {nested: "value2"}}
    error = ObservableRails::StructuredError.new(context: error_context)

    expected_message = <<~EXPECTED
      {
        :key1 => "value1",
        :key2 => {
          :nested => "value2"
        }
      }
    EXPECTED

    assert_equal expected_message.strip, error.message.strip
  end

  def test_still_returns_the_context_correctly_when_only_context_is_supplied
    error_context = {key1: "value1", key2: {nested: "value2"}}
    error = ObservableRails::StructuredError.new(context: error_context)

    assert_equal error_context, error.context
  end
end
