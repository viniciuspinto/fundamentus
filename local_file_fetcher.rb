class LocalFileFetcher
  def initialize(dir_path, file_ext = '.html')
    @dir_path = dir_path
    @file_ext = file_ext
  end

  def fetch(urls)
    response = {}
    urls.each do |key, url|
      path = @dir_path + "#{key}" + @file_ext
      if File.readable?(path)
        response[key] = File.read(path)
      end
    end
    response
  end
end
