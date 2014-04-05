require_relative './config.rb'

class FundamentusParserTest < MiniTest::Unit::TestCase

  def setup
    @parser = FundamentusParser.new
  end

  def test_parse_valid_file
    load_valid_file
    @parsed[:market_cap].must_equal '158.169.000.000'
    @parsed[:last_processed].must_equal '31/12/2013'
    @parsed[:pl].must_equal '1.374,30'
    @parsed[:pvp].must_equal '1,07'
    @parsed[:pebit].must_equal '3,43'
    @parsed[:lpa].must_equal '0,02'
    @parsed[:vpa].must_equal '27,65'
    @parsed[:net_margin].must_equal '-0,3%'
    @parsed[:net_debt].must_equal '56.511.800.000'
    @parsed[:net_assets].must_equal '148.346.000.000'
    @parsed[:yearly_net_income].must_equal '101.490.000.000'
    @parsed[:yearly_net_profit].must_equal '115.091.000'
  end

  def test_parse_invalid_file
    load_invalid_file
    @parsed[:market_cap].must_equal nil
    @parsed[:last_processed].must_equal nil
    @parsed[:pl].must_equal nil
    @parsed[:pvp].must_equal nil
    @parsed[:pebit].must_equal nil
    @parsed[:lpa].must_equal nil
    @parsed[:vpa].must_equal nil
    @parsed[:net_margin].must_equal nil
    @parsed[:net_debt].must_equal nil
    @parsed[:net_assets].must_equal nil
    @parsed[:yearly_net_income].must_equal nil
    @parsed[:yearly_net_profit].must_equal nil
  end

  def load_valid_file
    @page = File.open(File.expand_path('vale5.html', File.dirname(__FILE__) + '/data/')).read
    @parsed = @parser.parse(@page)
  end

  def load_invalid_file
    @page = '<html>';
    @parsed = @parser.parse(@page)
  end

end
