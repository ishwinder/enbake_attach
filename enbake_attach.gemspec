Gem::Specification.new do |s|
  s.name        = 'enbake_attach'
  s.version     = '0.0.1'
  s.date        = '2015-09-17'
  s.summary     = "Enbake Attach"
  s.description = "Enbake Attach is a Gem for handling attachments in Rails. Its a whoopie doo version of attachment_fu"
  s.authors     = ["Ishwinder Singh"]
  s.email       = 'singh.ishwinder@gmail.com'
  s.files       = `git ls-files`.split($/)
  s.require_paths = ["lib"]

  s.add_dependency('exifr')
  s.add_dependency('rmagick')

  s.homepage    =
    'http://github.com/ishwinder/enbake_attach'
  s.license       = 'MIT'
end