require_relative './config.rb'

class FundamentusParserTest < MiniTest::Unit::TestCase

  def setup
    @parser = FundamentusParser.new
    @page = File.open(File.expand_path('vale5.html', File.dirname(__FILE__) + '/data/')).read
  end

  def test_parse_market_cap
    parsed = @parser.parse(@page)
    parsed.first[:market_cap].must_equal '157.525.000.000'
  end

end
