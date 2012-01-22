# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "onthesnow/version"

Gem::Specification.new do |s|
  s.name        = "onthesnow"
  s.version     = Onthesnow::VERSION
  s.authors     = ["Jan Owiesniak"]
  s.email       = ["jowiesniak@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{"Small API to communicate with http://www.onthesnow.com"}
  s.description = %q{""}

  s.rubyforge_project = "onthesnow"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
