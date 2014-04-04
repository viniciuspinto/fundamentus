class FundamentusFetcher

  def initialize(fetcher, options = {})
    @fetcher = fetcher
    if options.has_key?(:verbose)
      @verbose = options[:verbose]
    end
  end

  def fetch(stock_codes)
    if not stock_codes.is_a?(Array)
      stock_codes = [stock_codes]
    end
    urls = {}
    stock_codes.each do |code|
      urls[code] = url_for code
    end
    return @fetcher.fetch(urls)
  end

  def url_for(code)
    'http://www.fundamentus.com.br/detalhes.php?papel=' + code
  end

end
