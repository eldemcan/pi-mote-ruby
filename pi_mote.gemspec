lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pi_mote/version"

Gem::Specification.new do |spec|
  spec.name          = "pi_mote"
  spec.version       = PiMote::VERSION
  spec.authors       = ["Can Eldem"]
  spec.email         = ["eldemcan@gmail.com"]

  spec.summary       = %q{Control your pi mote with ruby}
  spec.description   = %q{Ruby library for pi mite raspberry pi}
  spec.homepage      = "https://github.com/eldemcan/pi-mote-ruby"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  #   spec.metadata["homepage_uri"] = spec.homepage
  #   spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  #   spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.glob("{lib}/**/*")
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rpi_gpio', '~> 0.5.0'
  spec.add_development_dependency 'bundler', "~> 2.1"
  spec.add_development_dependency 'rspec', '~> 3.10'
end
