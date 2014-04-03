require 'open-uri'

class UrlFetcher
  def fetch(urls)
    responses = {}
    urls.each do |key, url|
      responses[key] = download(url)
    end
    responses
  end

  def download(url)
    open(url) do |f|
      f.read
    end
  end
end
