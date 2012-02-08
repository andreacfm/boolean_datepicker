$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "boolean_datepicker/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "boolean_datepicker"
  s.version     = BooleanDatepicker::VERSION
  s.authors     = "Andrea Campolonghi"
  s.email       = "acampolonghi@gmail.com"
  s.homepage    = ""
  s.summary     = "When a boolean field is saved with a true value saved the datetime."
  s.description = ""

  s.files = Dir["{app,config,db,lib}/**/*"] + ["README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_development_dependency "activerecord"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "sqlite3"
end
