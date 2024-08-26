# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "minitest/autorun"
require "minitest/pride"

Dir.glob("./test/**/*_test.rb").sort.each { |file| require file }
