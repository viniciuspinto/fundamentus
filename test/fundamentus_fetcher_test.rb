require_relative './config.rb'

class FundamentusFetcherTest < Minitest::Test

  def setup
    @url_fetcher = MiniTest::Mock.new
    @fundamentus_fetcher = FundamentusFetcher.new(@url_fetcher)
  end

  def test_fetching_page_with_code_as_string
    expected_call_args = { 'VALE5' => 'http://www.fundamentus.com.br/detalhes.php?papel=VALE5' }
    @url_fetcher.expect :fetch, nil, [expected_call_args]
    @fundamentus_fetcher.fetch('VALE5')
  end

  def test_fetching_page_with_array_of_codes
    expected_call_args = {
      'VALE5' => 'http://www.fundamentus.com.br/detalhes.php?papel=VALE5',
      'PETR4' => 'http://www.fundamentus.com.br/detalhes.php?papel=PETR4'
    }
    @url_fetcher.expect :fetch, nil, [expected_call_args]
    @fundamentus_fetcher.fetch(['VALE5', 'PETR4'])
  end

end
