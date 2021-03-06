require_relative './config.rb'

class FundamentusAcceptanceTest < Minitest::Test

  def test_save_financial_data

    stocks = {
      'PETR4' => { json_path: TEST_DIR + 'output/PETR4.json', json: petr4_json },
      'VALE5' => { json_path: TEST_DIR + 'output/VALE5.json', json: vale5_json }
    }

    # Clean up previous tests output files
    stocks.each do |code, info|
      File.unlink(info[:json_path]) unless not File.exists?(info[:json_path])
    end

    fetcher = LocalFileFetcher.new(TEST_DIR + 'data/')

    FundamentusData.save stocks.keys, TEST_DIR + 'output/', :fetcher => fetcher

    stocks.each do |code, info|
      assert_equal info[:json], File.open(info[:json_path]).read
    end

  end

  private

    def petr4_json
      '{"share_count":"13.044.500.000","market_cap":"201.407.000.000","last_processed":"31/12/2013","pl":"8,54","pvp":"0,58","pebit":"4,04","lpa":"1,81","vpa":"26,67","net_margin":"7,5%","net_debt":"221.549.000.000","net_assets":"347.940.000.000","yearly_net_income":"304.890.000.000","yearly_net_profit":"23.570.400.000","quarterly_net_income":"81.028.000.000","quarterly_net_profit":"6.281.530.000"}'
    end

    def vale5_json
      '{"share_count":"5.365.300.000","market_cap":"158.169.000.000","last_processed":"31/12/2013","pl":"1.374,30","pvp":"1,07","pebit":"3,43","lpa":"0,02","vpa":"27,65","net_margin":"-0,3%","net_debt":"56.511.800.000","net_assets":"148.346.000.000","yearly_net_income":"101.490.000.000","yearly_net_profit":"115.091.000","quarterly_net_income":"28.626.200.000","quarterly_net_profit":"-14.867.100.000"}'
    end

end
