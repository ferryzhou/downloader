require 'thread/pool'
require 'fileutils'
require 'open-uri'

class Downloader

  def initialize(archieves_root, thread_count = 10)
    @archiever = UrlArchiever.new(archieves_root)
    @thread_count = thread_count
  end
  
  # task_array: array of [name, url] pairs, or array of urls
  def run(task_array)
    pool = Thread.pool(@thread_count)
    task_array.each do |task| 
      case task
      when Array
        pool.process {@archiever.read_and_save_url(task[1], task[0])} 
      when String
        pool.process {@archiever.read_and_save_url(task)} 
      end
    end
    pool.shutdown()
  end
  
end

def filename_from_url(url, encoding = 'gbk')
  p url
  uri = URI.parse(url)
  s = URI.decode(File.basename(uri.path))
  s.force_encoding(encoding).encode("utf-8")
end

# given a file containing urls and names, 
# extract the corresponding contents and store to local files
class UrlArchiever
  
  def initialize(archieves_root, encoding = 'gbk', write_mode = 'wb')
    @archieves_root = archieves_root
    @write_mode = write_mode
    @encoding = encoding
    FileUtils.mkdir_p(archieves_root)
  end
  
  def read_and_save_url(url, name = nil)
    puts 'extracting ' + url + ' ...............'
    name ||= filename_from_url(url, @encoding)
    begin
      local_path = File.join(@archieves_root, name)
      p "local path: #{local_path} ..."
	    return if File.exists?(local_path)
      source = open(url)
      content = source.respond_to?(:read) ? source.read : source.to_s
      p 'writing ...'
      File.new(local_path + '.tmp', @write_mode).puts(content)
      File.rename(local_path + '.tmp', local_path)
    rescue
      puts $!
      puts('[Error] can not read url: ' + url + '!');
    end
    puts 'finshed extracting ' + url + ' ____________________'
  end
  
end
