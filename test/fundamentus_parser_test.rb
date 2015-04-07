require_relative './config.rb'

class FundamentusParserTest < Minitest::Test

  def setup
    @parser = FundamentusParser.new
  end

  def test_parse_valid_file
    load_valid_file
    assert_equal '5.365.300.000', @parsed[:share_count]
    assert_equal '158.169.000.000', @parsed[:market_cap]
    assert_equal '31/12/2013', @parsed[:last_processed]
    assert_equal '1.374,30', @parsed[:pl]
    assert_equal '1,07', @parsed[:pvp]
    assert_equal '3,43', @parsed[:pebit]
    assert_equal '0,02', @parsed[:lpa]
    assert_equal '27,65', @parsed[:vpa]
    assert_equal '-0,3%', @parsed[:net_margin]
    assert_equal '56.511.800.000', @parsed[:net_debt]
    assert_equal '148.346.000.000', @parsed[:net_assets]
    assert_equal '101.490.000.000', @parsed[:yearly_net_income]
    assert_equal '115.091.000', @parsed[:yearly_net_profit]
    assert_equal '28.626.200.000', @parsed[:quarterly_net_income]
    assert_equal '-14.867.100.000', @parsed[:quarterly_net_profit]
  end

  def test_parse_invalid_file
    load_invalid_file
    assert_nil @parsed[:share_count]
    assert_nil @parsed[:market_cap]
    assert_nil @parsed[:last_processed]
    assert_nil @parsed[:pl]
    assert_nil @parsed[:pvp]
    assert_nil @parsed[:pebit]
    assert_nil @parsed[:lpa]
    assert_nil @parsed[:vpa]
    assert_nil @parsed[:net_margin]
    assert_nil @parsed[:net_debt]
    assert_nil @parsed[:net_assets]
    assert_nil @parsed[:yearly_net_income]
    assert_nil @parsed[:yearly_net_profit]
    assert_nil @parsed[:quarterly_net_income]
    assert_nil @parsed[:quarterly_net_profit]
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
