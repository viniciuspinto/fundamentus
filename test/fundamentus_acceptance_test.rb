require_relative './config.rb'

class FundamentusAcceptanceTest < MiniTest::Unit::TestCase

  def test_save_financial_data

    stocks = {
      'PETR4' => { json_path: TEST_DIR + 'output/PETR4.json', json: petr4_json },
      'VALE5' => { json_path: TEST_DIR + 'output/VALE5.json', json: vale5_json }
    }

    stocks.each do |code, info|
      File.unlink(info[:json_path]) unless not File.exists?(info[:json_path])
    end

    html_fetcher = LocalFileFetcher.new(TEST_DIR + 'data/')
    file_manager = FileManager.new(TEST_DIR + 'output/')
    parser = FundamentusParser.new

    pages = FundamentusFetcher.new(html_fetcher).fetch(stocks.keys)

    pages.each do |key, content|
      file_manager.save(key + '.json', parser.parse(content).to_json)
    end

    stocks.each do |code, info|
      File.open(info[:json_path]).read.must_equal info[:json]
    end

  end

  private

    def petr4_json
      '{"market_cap":"200.885.000.000","last_processed":"31/12/2013","net_debt":"221.549.000.000","net_assets":"347.940.000.000","yearly_net_income":"304.890.000.000","yearly_net_profit":"23.570.400.000"}'
    end

    def vale5_json
      '{"market_cap":"157.525.000.000","last_processed":"31/12/2013","net_debt":"56.511.800.000","net_assets":"148.346.000.000","yearly_net_income":"101.490.000.000","yearly_net_profit":"115.091.000"}'
    end

end
