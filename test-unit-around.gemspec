# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "test/unit/around/version"

Gem::Specification.new do |s|
  s.name        = "test-unit-around"
  s.version     = Test::Unit::Around::VERSION
  s.authors     = ["Benjamin Vetter"]
  s.email       = ["vetter@flakks.com"]
  s.homepage    = "https://github.com/mrkamel/test-unit-around"
  s.summary     = %q{Use around instead or in combination with test/unit's setup and teardown methods}
  s.description = %q{Use around instead or in combination with test/unit's setup and teardown methods}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rake"
  s.add_dependency 'test-unit', '>= 2.4.0'
end

