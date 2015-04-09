require_relative './fundamentus_fetcher'
require_relative './fundamentus_parser'
require_relative './util/url_fetcher'
require_relative './util/file_manager'

class FundamentusData
  def self.save(stock_codes, destination_path, options = {})
    destination_path = File.expand_path(destination_path, Dir.pwd) + '/'

    fetcher = options[:fetcher] || UrlFetcher.new(options)

    file_manager = FileManager.new(destination_path, options)
    parser = FundamentusParser.new(options)

    pages = FundamentusFetcher.new(fetcher, options).fetch(stock_codes)
    pages.each do |key, content|
      file_manager.save(key + '.json', parser.parse(content).to_json)
    end
  end
end
