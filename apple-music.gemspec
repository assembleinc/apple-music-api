# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "apple/music/version"

Gem::Specification.new do |spec|
  spec.name          = "apple-music"
  spec.version       = Apple::Music::VERSION
  spec.authors       = ["Chris McGrath"]
  spec.email         = ["chris@inkstonehq.com"]
  
  spec.summary       = %q{Accessibility layer gem for the Apple Music API}
  spec.homepage      = "https://bitbucket.org/fruitstone/apple-music-api"
  spec.license       = "MIT"
  
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'pry', '~> 0.10.0'
  spec.add_development_dependency 'pry-doc'
  spec.add_development_dependency 'pry-byebug', '~> 3.6'
  spec.add_development_dependency 'dotenv-rails'
  spec.add_development_dependency 'rubocop'
  
  spec.add_runtime_dependency 'jwt' # TODO: figure out version
end
