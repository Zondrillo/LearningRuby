class WordReader

  def read_from_file(file_name)
    current_path = File.dirname(__FILE__)
    file_path = "#{current_path}/#{file_name}"
    begin
      file = File.new(file_path, 'r:UTF-8')
      lines = file.readlines
      file.close
      return lines.sample.chomp
    rescue Errno::ENOENT
      abort "Файл #{file_name} не найден"
    end
  end
end
