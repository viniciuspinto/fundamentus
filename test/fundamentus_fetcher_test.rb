require_relative './config.rb'

class FundamentusFetcherTest < Minitest::Test

  def setup
    @url_fetcher = MiniTest::Mock.new
    @fundamentus_fetcher = FundamentusFetcher.new(@url_fetcher)
  end

  def test_fetching_page_with_code_as_string
    code = 'VALE5'
    args = { code => 'http://www.fundamentus.com.br/detalhes.php?papel=' + code }
    @url_fetcher.expect :fetch, nil, [args]
    @fundamentus_fetcher.fetch(code)
  end

  def test_fetching_page_with_array_of_codes
    stock_codes = ['VALE5', 'PETR4', 'ITUB4']
    args = {}
    stock_codes.each do |code|
      args[code] = 'http://www.fundamentus.com.br/detalhes.php?papel=' + code
    end
    @url_fetcher.expect :fetch, nil, [args]
    @fundamentus_fetcher.fetch(stock_codes)
  end

end
