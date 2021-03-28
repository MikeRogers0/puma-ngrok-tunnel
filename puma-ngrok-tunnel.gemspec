lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'puma-ngrok-tunnel/version'

Gem::Specification.new do |spec|
  spec.name          = 'puma-ngrok-tunnel'
  spec.version       = PumaNgrokTunnel::VERSION
  spec.authors       = ['Mike Rogers']
  spec.email         = ['me@mikerogers.io']

  spec.summary       = 'Puma integration for starting a Ngrok Tunnel'
  spec.description   = 'A Puma plugin that opens a ngrok tunnel after the rails server starts'
  spec.homepage      = 'https://github.com/mikerogers0/puma-ngrok-tunnel'
  spec.license       = 'MIT'

  spec.metadata = {
    'bug_tracker_uri' => "#{spec.homepage}/issues",
    'changelog_uri' => "#{spec.homepage}/blob/master/CHANGELOG.md",
    'documentation_uri' => spec.homepage,
    'homepage_uri' => spec.homepage,
    'source_code_uri' => spec.homepage,
    'funding_uri' => 'https://www.buymeacoffee.com/MikeRogers0'
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.6'

  spec.add_runtime_dependency 'ngrok-tunnel', '~> 2.1', '>= 2.1.1'
  spec.add_runtime_dependency 'puma', '>= 3', '< 6'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 1.0'
  spec.add_development_dependency 'simplecov', '~> 0.21.2'
  spec.add_development_dependency 'yard', '~> 0.9.24'
end
