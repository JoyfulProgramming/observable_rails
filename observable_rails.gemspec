# frozen_string_literal: true

require_relative "lib/observable_rails/version"

Gem::Specification.new do |spec|
  spec.name = "observable_rails"
  spec.version = ObservableRails::VERSION
  spec.authors = ["John Gallagher"]
  spec.email = ["john@synapticmishap.co.uk"]

  spec.summary = "Observe your Rails app using Open Telemetry"
  spec.description = "Observe your Rails app using Open Telemetry"
  spec.homepage = "https://github.com/JoyfulProgramming/observable_rails"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/JoyfulProgramming/observable_rails"
  spec.metadata["changelog_uri"] = "https://github.com/JoyfulProgramming/observable_rails/CHANGELOG.md"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "bin"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "awesome_print", "~> 1.9.2"
  spec.add_development_dependency "rspec", "~> 3.12.0"
  spec.add_development_dependency "super_diff", "~> 0.10.0"
end
