require 'open-uri'

class UrlFetcher

  def initialize(options = {})
    if options.has_key?(:verbose)
      @verbose = options[:verbose]
    end
  end

  def fetch(urls)
    responses = {}
    urls.each do |key, url|
      if @verbose
        puts "Downloading #{key} from #{url}"
      end
      responses[key] = download(url)
      sleep(0.5)
    end
    responses
  end

  def download(url)
    URI.open(url, "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:112.0) Gecko/20120304 Firefox/118.3") do |f|
      f.read
    end
  end

end
