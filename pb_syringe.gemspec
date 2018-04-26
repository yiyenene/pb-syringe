
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pb_syringe/version"

Gem::Specification.new do |spec|
  spec.name          = "pb_syringe"
  spec.version       = PbSyringe::VERSION
  spec.authors       = ["yiyenene"]
  spec.email         = ["goodbyeboredworld@aol.jp"]

  spec.summary       = "injects progress bar function to object"
  spec.homepage      = "https://github.com/yiyenene/pb-syringe"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "ansi", ">= 1.5"
  spec.required_ruby_versioin = ">= 2.1"
end
