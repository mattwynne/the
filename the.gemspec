Gem::Specification.new do |s|
  s.name = "the"
  s.version = "0.0.3"

  s.required_rubygems_version = '>= 1.3.5'
  s.authors = ["Matt Wynne"]
  s.date = "2010-12-07"
  s.description = %q{Simple and clean domain model DSL for tests}
  s.email = "matt@mattwynne.net"

  s.homepage = "http://github.com/mattwynne/the"
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubygems_version = "1.3.6"
  s.summary = %q{Cucumber plug-in for talking sense to your models}
  
  s.require_path = "lib"
  s.files        = `git ls-files`.split("\n")
end
