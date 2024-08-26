# frozen_string_literal: true

require_relative "observable_rails/version"

module ObservableRails
  class Error < StandardError; end

  class StructuredError < StandardError
    attr_reader :context

    def initialize(message = nil, context: nil)
      @context = context || {}
      if message.nil?
        require "awesome_print"
        super(@context.ai(ruby19_syntax: true, plain: true, indent: 2))
      else
        super(message)
      end
    end
  end
end
