Gem::Specification.new do |s|
  s.name        = 'qimport'
  s.version     = '0.1.1'
  s.date        = '2013-09-17'
  s.summary     = "qimport"
  s.description = "Qimport is a library for building Quickbooks iif files."
  s.authors     = ["Brett Basler"]
  s.email       = 'geekbrett@gmail.com'
  s.files       = ["lib/qimport.rb", "lib/qimport/import.rb", "lib/qimport/group.rb"]
  s.homepage    =
    'http://github.com/br3tt/qimport'
  s.license       = 'MIT'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end
