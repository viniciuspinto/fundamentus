require 'json'

class FileManager

  def initialize(dir_path, options = {})
    @dir_path = dir_path
    if options.has_key?(:verbose)
      @verbose = options[:verbose]
    end
  end

  def save(file_name, content)
    if @verbose
      puts "Saving content of length #{content.size} to #{@dir_path + file_name}"
    end
    File.open(@dir_path + file_name, 'w') do |f|
      f.write(content)
    end
  end

end
