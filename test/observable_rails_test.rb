# frozen_string_literal: true

require "observable_rails"

class TestObservableRailsStructuredError < Minitest::Test
  def test_returns_the_message_and_context_passed_to_the_constructor
    error_message = "Test error message"
    error_context = {key: "value"}

    error = ObservableRails::StructuredError.new(error_message, context: error_context)

    assert_equal error_message, error.message
    assert_equal error_context, error.context
  end

  def test_sets_the_message_to_the_pretty_printed_context_using_awesome_print
    error_context = {key1: "value1", key2: {nested: "value2"}}
    error = ObservableRails::StructuredError.new(context: error_context)

    expected_message = <<~EXPECTED
      {
        key1: "value1",
        key2: {
          nested: "value2"
        }
      }
    EXPECTED

    assert_equal expected_message.strip, error.message.strip
    assert_equal error_context, error.context
  end

  def test_context_is_accessible_when_message_is_supplied
    error = ObservableRails::StructuredError.new("Test error message", context: {key: "value"})

    assert_equal({key: "value"}, error.context)
  end

  def test_context_is_empty_hash_when_not_supplied
    error = ObservableRails::StructuredError.new("Test error message")

    assert_equal({}, error.context)
  end

  def test_context_is_empty_hash_when_nil_is_supplied
    error = ObservableRails::StructuredError.new("Test error message", context: nil)

    assert_equal({}, error.context)
  end
end
