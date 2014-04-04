require 'json'

class FileManager

  def initialize(dir_path)
    @dir_path = dir_path
  end

  def save(file_name, content)
    File.open(@dir_path + file_name, 'w') do |f|
      f.write(content)
    end
  end

end
