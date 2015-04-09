require_relative './fundamentus_fetcher.rb'
require_relative './url_fetcher.rb'
require_relative './file_manager.rb'
require_relative './fundamentus_parser.rb'

class FundamentusData
  def self.save(stock_codes, destination_path)
    destination_path = File.expand_path(destination_path, File.dirname(__FILE__)) + '/'

    html_fetcher = UrlFetcher.new({ verbose: true })
    pages        = FundamentusFetcher.new(html_fetcher, { verbose: true }).fetch(stock_codes)
    file_manager = FileManager.new(destination_path, { verbose: true })
    parser       = FundamentusParser.new({ verbose: true })

    pages.each do |key, content|
      file_manager.save(key + '.json', parser.parse(content).to_json)
    end
  end
end
