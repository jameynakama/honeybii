Gem::Specification.new do |s|
  s.name = 'honeybii'
  s.version = '1.0.0'
  s.date = '2014-04-04'
  s.executables << 'honeybii'
  s.add_runtime_dependency 'rmagick', ['< 3.0']
  s.files = ['lib/honeybii.rb', 'lib/honeybii/ascii_image.rb', 'lib/honeybii/shaded_image.rb']
  s.summary = 'An image to ascii converter'
  s.description = 'A command-line image to ascii conversion tool'
  s.authors = ['Jamey DeOrio']
  s.email = 'jamey@jameydeorio.com'
  s.homepage = 'http://honeybii.com'
  s.license = 'MIT'
end
