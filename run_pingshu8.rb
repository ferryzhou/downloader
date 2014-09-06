require_relative 'downloader'

#  'http://down1.pingshu8.com:8000/3/ps/%C1%F5%C0%BC%B7%BC_%C2%DE%C2%ED%BE%FC%CD%C5%CF%FB%CA%A7%D6%AE%C3%D5/%C1%F5%C0%BC%B7%BC_%C2%DE%C2%ED%BE%FC%CD%C5%CF%FB%CA%A7%D6%AE%C3%D5_001.mp3'

# 刘兰芳 -> %C1%F5%C0%BC%B7%BC
def cn_utf_to_gbk_url(name)
  URI.encode(name.encode('gbk'))
end

def gbk_url_to_cn_utf(url)
  URI.decode(url).force_encoding('gbk').encode("utf-8")
end

def get_pingshu8_url(dir_str, uname, i, format_ind)  
  format = "%0#{format_ind}d"
  "http://down1.pingshu8.com:8000/#{format_ind}/ps/#{dir_str}/#{uname}_#{format % i}.mp3"
end

def crawl_pingshu8(name, count, format_ind, hui=false)

uname = cn_utf_to_gbk_url(name)
dir_str = uname
dir_str += cn_utf_to_gbk_url("(#{count}回)") if hui
tasks = (1..count).collect { |i| get_pingshu8_url(dir_str, uname, i, format_ind) }

crawl_all(tasks, name)
end

def crawl_all(tasks, name)
  thread_count = 5;
  archieves_root = File.join('results', name);

  runner = Downloader.new(archieves_root, thread_count);
  runner.run(tasks)
end

def crawl_pingshu8_by_sample_url(sample_url, count)
  full_name = gbk_url_to_cn_utf(File.basename(sample_url, ".mp3"))
  index = full_name.rindex('_')
  name = full_name[0...index]
  num_str = full_name[index+1..-1]
  p "num_str: #{num_str}"
  format = "%0#{num_str.size}d"
  base_url = sample_url[0...(-4 - num_str.size)]
  p 'base_url: ' + base_url
  tasks = (1..count).collect { |i| base_url + format % i + ".mp3" }
  crawl_all(tasks, name)
end


#crawl_pingshu8('刘兰芳_罗马军团消失之谜', 67, 3, false)
#crawl_pingshu8('刘兰芳_小将岳云', 41, 2, true)
#crawl_pingshu8('刘兰芳_呼延庆', 30, 2, true) #wrong
#http://down1.pingshu8.com:8000/3/ps/%C1%F5%C0%BC%B7%BC_%BB%EC%CA%C0%C4%A7%CD%F5%B3%CC%D2%A7%BD%F0/%C1%F5%C0%BC%B7%BC_%BB%EC%CA%C0%C4%A7%CD%F5%B3%CC%D2%A7%BD%F0_001.mp3
#crawl_pingshu8('刘兰芳_混世魔王程咬金', 100, 3, false)
#sample_url = "http://down1.pingshu8.com:8000/1/ps/%C1%F5%C0%BC%B7%BC_%CE%F7%CC%C6%D1%DD%D2%E5/%C1%F5%C0%BC%B7%BC_%CE%F7%CC%C6%D1%DD%D2%E5_001.mp3"
#sample_url = "http://down1.pingshu8.com:8000/3/ps/%C1%F5%C0%BC%B7%BC_%B7%AE%C0%E6%BB%A8/%C1%F5%C0%BC%B7%BC_%B7%AE%C0%E6%BB%A8_001.mp3"; count=75;
#sample_url = "http://down1.pingshu8.com:8000/1/ps/%C1%F5%C0%BC%B7%BC_%CB%AB%C7%B9%C0%CF%CC%AB%C6%C5/%C1%F5%C0%BC%B7%BC_%CB%AB%C7%B9%C0%CF%CC%AB%C6%C5_001.mp3"; count=47;
#sample_url = "http://down1.pingshu8.com:8000/3/ps/%C1%F5%C0%BC%B7%BC_%D3%DD%CB%B4%B4%F3%B4%AB/%C1%F5%C0%BC%B7%BC_%D3%DD%CB%B4%B4%F3%B4%AB_001.mp3"; count=200;
sample_url = "http://down01.pingshu8.com:8000/3/ps/%C1%F5%C0%BC%B7%BC_%D1%E0%C8%AA%CF%E3%B4%AB%C6%E6/%C1%F5%C0%BC%B7%BC_%D1%E0%C8%AA%CF%E3%B4%AB%C6%E6_01.mp3"; count=54;
crawl_pingshu8_by_sample_url(sample_url, count)
