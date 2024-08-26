# frozen_string_literal: true

require_relative "observable_rails/version"

module ObservableRails
  class Error < StandardError; end

  class StructuredError < StandardError
    attr_reader :context

    def initialize(message = nil, context: {})
      @context = context
      if message.nil?
        require "awesome_print"
        super(@context.ai(plain: true, indent: 2))
      else
        super(message)
      end
    end
  end
end
