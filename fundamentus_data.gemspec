Gem::specification.new do |s|
  s.name = 'fundamentus_data'
  s.version = '0.1.0'
  s.license = 'MIT'
  s.summary = 'Save brazilian stock data from the Fundamentus site in JSON format'
  s.author = 'Vinicius Pinto'
  s.email = ['contact@codense.com']
  s.files      = `git ls-files`.split("\n") | Dir.glob('fundamentus_data/**/*')
  s.test_files = `git ls-files -- test/*`.split("\n")
  s.platform = Gem::Platform::CURRENT

  s.add_dependency 'nokogiri'
  s.add_development_dependency 'minitest'
end
