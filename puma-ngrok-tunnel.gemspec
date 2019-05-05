lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "puma-ngrok-tunnel/version"


Gem::Specification.new do |spec|
  spec.name          = 'puma-ngrok-tunnel'
  spec.version       = PumaNgrokTunnel::VERSION
  spec.authors       = ['Mike Rogers']
  spec.email         = ['me@mikerogers.io']

  spec.summary       = 'Puma integration for starting a Ngrok Tunnel'
  spec.description   = 'A Puma plugin that opens a ngrok tunnel after the rails server starts'
  spec.homepage      = 'https://github.com/mikerogers0/puma-ngrok-tunnel'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = 'https://rubygems.org'
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.5.0'

  spec.add_runtime_dependency 'ngrok-tunnel', '~> 2.1', '>= 2.1.1'
  spec.add_runtime_dependency 'puma', '~> 3.0'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
end
