Gem::Specification.new do |s|
  s.name        = 'Enbake Attach'
  s.version     = '0.0.1'
  s.date        = '2015-09-17'
  s.summary     = "Hola!"
  s.description = "A simple hello world gem"
  s.authors     = ["Ishwinder Singh"]
  s.email       = 'singh.ishwinder@gmail.com'
  s.files       = ["lib/hapgood/attach.rb"]

  s.add_dependency('exifr')
  s.add_dependency('rmagick')

  s.homepage    =
    'http://github.com/ishwinder/enbake_attach'
  s.license       = 'MIT'
end