# frozen_string_literal: true

require "observable_rails"

RSpec.describe ObservableRails::StructuredError do
  describe "#context" do
    let(:error_message) { "Test error message" }
    let(:error_context) { {key: "value"} }
    subject { described_class.new(error_message, context: error_context) }

    it "returns the context passed to the constructor" do
      expect(subject.context).to eq(error_context)
    end

    it "does not include the context in the error message" do
      expect(subject.message).to eq(error_message)
    end
  end
end
