Gem::Specification.new do |s|
  s.name = 'fundamentus_data'
  s.version = '0.1.0'
  s.license = 'MIT'
  s.summary = 'Save brazilian stock data from the Fundamentus site in JSON format'
  s.description = 'Fundamentus.com.br is a brazilian site that provides financial information about companies listed in Bovespa (the brazilian stock market). This gem can be used to save data from specified stocks in JSON format for later processing.'
  s.author = 'Vinicius Pinto'
  s.email = 'contact@codense.com'
  s.homepage = 'http://github.com/viniciuspinto/fundamentus'
  s.files      = `git ls-files`.split("\n") | Dir.glob('fundamentus_data/**/*')
  s.test_files = `git ls-files -- test/*`.split("\n")

  s.add_dependency 'nokogiri', '~> 1.6'
  s.add_development_dependency 'minitest', '~> 5.5'
end
