
require 'open-uri'
require 'net/http'

# given a file containing urls and names, 
# extract the corresponding contents and store to local files
class UrlArchiever
  
  def initialize(archieves_root, extension, write_mode = 'wb')
    @archieves_root = archieves_root
	@extension = extension
	@write_mode = write_mode
    create_if_missing(archieves_root)
  end
  
  def read_and_save_url(url, name)
    puts 'extracting ' + url + ' ...............'
    begin
      raw_source_path = File.join(@archieves_root, "#{name}.#{@extension}")
	  return if File.exists?(raw_source_path)
      source = open(url)
      content = source.respond_to?(:read) ? source.read : source.to_s
      File.new(raw_source_path, @write_mode).puts(content)
    rescue
      puts $!
      puts('[Error] can not read url: ' + url + '!');
    end
    puts 'finshed extracting ' + url + ' ____________________'
  end
  
  def create_if_missing(name)
    Dir.mkdir(name) unless File.directory?(name)
  end 
  
end


