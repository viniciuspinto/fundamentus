require_relative './config.rb'

class FundamentusParserTest < MiniTest::Unit::TestCase

  def setup
    @parser = FundamentusParser.new
    @page = File.open(File.expand_path('vale5.html', File.dirname(__FILE__) + '/data/')).read
    @parsed = @parser.parse(@page)
  end

  def test_parse_market_cap
    @parsed.first[:market_cap].must_equal '157.525.000.000'
  end

  def test_parse_last_processed
    @parsed.first[:last_processed].must_equal '31/12/2013'
  end

  def test_parse_net_debt
    @parsed.first[:net_debt].must_equal '56.511.800.000'
  end

  def test_parse_net_assets
    @parsed.first[:net_assets].must_equal '148.346.000.000'
  end

  def test_parse_yearly_net_income
    @parsed.first[:yearly_net_income].must_equal '101.490.000.000'
  end

  def test_parse_yearly_net_profit
    @parsed.first[:yearly_net_profit].must_equal '115.091.000'
  end

end
