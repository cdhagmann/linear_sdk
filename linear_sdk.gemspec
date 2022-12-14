# frozen_string_literal: true

require_relative "lib/linear/version"

Gem::Specification.new do |spec|
  spec.name = "linear_sdk"
  spec.version = Linear::VERSION
  spec.authors = ["Christopher Dean Hagmann"]
  spec.email = ["cdhagmann@gmail.com"]

  spec.summary = "Wrapper around the Linear SDK"
  spec.description = "Wrapper around the Linear SDK"
  spec.homepage = "https://cdhagmann.com/linear_sdk"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.6"

  spec.metadata["allowed_push_host"] = "https://cdhagmann.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/cdhagmann/linear-sdk"
  spec.metadata["changelog_uri"] = "https://cdhagmann.com/linear/CHANGELOG"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "dry-configurable"
  spec.add_dependency "graphlient"
  spec.add_dependency "graphql-client"
  spec.add_dependency "activesupport"

  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "lockbox"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
