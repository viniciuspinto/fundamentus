require_relative './fundamentus_fetcher'
require_relative './fundamentus_parser'
require_relative './util/url_fetcher'
require_relative './util/file_manager'

class FundamentusData
  def self.save(stock_codes, destination_path)
    destination_path = File.expand_path(destination_path, Dir.pwd) + '/'

    html_fetcher = UrlFetcher.new({ verbose: true })
    pages        = FundamentusFetcher.new(html_fetcher, { verbose: true }).fetch(stock_codes)
    file_manager = FileManager.new(destination_path, { verbose: true })
    parser       = FundamentusParser.new({ verbose: true })

    pages.each do |key, content|
      file_manager.save(key + '.json', parser.parse(content).to_json)
    end
  end
end
