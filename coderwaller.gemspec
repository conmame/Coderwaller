# -*- encoding: utf-8 -*-
require File.expand_path('../lib/coderwaller/version', __FILE__)

Gem::Specification.new do |s|
  s.authors       = ["con_mame"]
  s.email         = ["con_mame@conma.me"]
  s.description   = %q{coderwaller is coderwall.com API Library. Get User Achievement. }
  s.summary       = %q{coderwall.com API Library.}
  s.homepage      = "https://github.com/conmame/coderwaller"
  s.extra_rdoc_files = [
    "README.md"
  ]

  s.files         = `git ls-files`.split($\)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.name          = "coderwaller"
  s.require_paths = ["lib"]
  s.version       = Coderwaller::VERSION
  s.date          = %q{2012-07-28}
  s.rdoc_options  = ["--charset=UTF-8"]

  s.required_ruby_version = '>= 1.9.0'
  s.add_development_dependency('rake', '>=0.9.2.2')
  s.add_development_dependency('rspec', '>=2.9.0')
  s.add_development_dependency('webmock', '=1.8.4')
end
