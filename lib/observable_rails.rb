# frozen_string_literal: true

require_relative "observable_rails/version"

module ObservableRails
  class Error < StandardError; end

  class StructuredError < StandardError
    attr_reader :context

    def initialize(message, context: {})
      super(message)
      @context = context
    end
  end
end
