require_relative './fundamentus_fetcher'
require_relative './fundamentus_parser'
require_relative './util/url_fetcher'
require_relative './util/file_manager'

class FundamentusData
  def self.save(stock_codes, destination_path, options = {})
    destination_path = File.expand_path(destination_path, Dir.pwd) + '/'

    html_fetcher = UrlFetcher.new(options)
    pages        = FundamentusFetcher.new(html_fetcher, options).fetch(stock_codes)
    file_manager = FileManager.new(destination_path, options)
    parser       = FundamentusParser.new(options)

    pages.each do |key, content|
      file_manager.save(key + '.json', parser.parse(content).to_json)
    end
  end
end
