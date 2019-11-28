# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "freefeed/version"

Gem::Specification.new do |spec|
  spec.name = "freefeed"
  spec.version = Freefeed::VERSION
  spec.authors = ["Alex Musayev"].freeze
  spec.email = ["alex.musayev@gmail.com"].freeze

  spec.summary = "Freefeed API wrapper"
  spec.description = "Freefeed API wrapper"
  spec.homepage = "https://github.com/dreikanter/freefeed"
  spec.license = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/dreikanter/freefeed"
    spec.metadata["changelog_uri"] = "https://github.com/dreikanter/freefeed/blob/master/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |file|
      file.match(%r{^(test|spec|features)/})
    end
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "dry-configurable"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "pry", "~> 0.12.2"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 0.77.0"
  spec.add_development_dependency "simplecov", "~> 0.17.1"
end
