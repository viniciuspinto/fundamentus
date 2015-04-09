require_relative './config.rb'

class FundamentusParserTest < Minitest::Test

  def setup
    @parser = FundamentusParser.new
  end

  def test_parse_valid_file
    @data = @parser.parse(valid_content)
    assert_equal '5.365.300.000', @data[:share_count]
    assert_equal '158.169.000.000', @data[:market_cap]
    assert_equal '31/12/2013', @data[:last_processed]
    assert_equal '1.374,30', @data[:pl]
    assert_equal '1,07', @data[:pvp]
    assert_equal '3,43', @data[:pebit]
    assert_equal '0,02', @data[:lpa]
    assert_equal '27,65', @data[:vpa]
    assert_equal '-0,3%', @data[:net_margin]
    assert_equal '56.511.800.000', @data[:net_debt]
    assert_equal '148.346.000.000', @data[:net_assets]
    assert_equal '101.490.000.000', @data[:yearly_net_income]
    assert_equal '115.091.000', @data[:yearly_net_profit]
    assert_equal '28.626.200.000', @data[:quarterly_net_income]
    assert_equal '-14.867.100.000', @data[:quarterly_net_profit]
  end

  def test_parse_invalid_file
    @data = @parser.parse(invalid_content)
    assert_nil @data[:share_count]
    assert_nil @data[:market_cap]
    assert_nil @data[:last_processed]
    assert_nil @data[:pl]
    assert_nil @data[:pvp]
    assert_nil @data[:pebit]
    assert_nil @data[:lpa]
    assert_nil @data[:vpa]
    assert_nil @data[:net_margin]
    assert_nil @data[:net_debt]
    assert_nil @data[:net_assets]
    assert_nil @data[:yearly_net_income]
    assert_nil @data[:yearly_net_profit]
    assert_nil @data[:quarterly_net_income]
    assert_nil @data[:quarterly_net_profit]
  end

  private

    def invalid_content
      '<html>'
    end

    def valid_content
      File.open(File.expand_path('vale5.html', File.dirname(__FILE__) + '/data/')).read
    end

end
