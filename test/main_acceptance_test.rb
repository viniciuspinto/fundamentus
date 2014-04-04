require_relative './config.rb'

class MainAcceptanceTest < MiniTest::Unit::TestCase

  def test_main

    stock_codes = ['VALE5', 'PETR4']

    stock_codes.each do |code|
      path = TEST_DIR + "output/#{code}.json"
      File.unlink(path) unless not File.exists?(path)
    end

    html_fetcher = LocalFileFetcher.new(TEST_DIR + 'data/')
    pages = FundamentusFetcher.new(html_fetcher).fetch(stock_codes)
    file_manager = FileManager.new(TEST_DIR + 'output/')
    parser = FundamentusParser.new

    pages.each do |key, content|
      file_manager.save(key + '.json', parser.parse(content).to_json)
    end

    stock_codes.each do |code|
      File.exists?(TEST_DIR + "output/#{code}.json").must_equal true
    end

  end

end
