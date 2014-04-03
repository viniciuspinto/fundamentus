class MainAcceptanceTest < MiniTest::Unit::TestCase

  def test_main
    stock_codes = ['VALE5', 'PETR4', 'ITUB4']

    pages = FundamentusPageFetcher.new(UrlFetcher.new).fetch(stock_codes)
    FileManager.save(FundamentusPageParser.new.parse(pages))

  end

end
