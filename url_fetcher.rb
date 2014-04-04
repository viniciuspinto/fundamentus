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
    open(url) do |f|
      f.read
    end
  end

end
