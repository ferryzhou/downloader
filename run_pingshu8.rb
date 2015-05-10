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
#sample_url = "http://down01.pingshu8.com:8000/3/ps/%C1%F5%C0%BC%B7%BC_%D1%E0%C8%AA%CF%E3%B4%AB%C6%E6/%C1%F5%C0%BC%B7%BC_%D1%E0%C8%AA%CF%E3%B4%AB%C6%E6_01.mp3"; count=54;
#sample_url = "http://down01.pingshu8.com:8000/1/ps/%C1%F5%C0%BC%B7%BC_%BA%F4%BC%D2%BD%AB/%C1%F5%C0%BC%B7%BC_%BA%F4%BC%D2%BD%AB_001.mp3"; count=93;
#sample_url = "http://down01.pingshu8.com:8000/1/ps/%C1%F5%C0%BC%B7%BC_%BA%EC%C2%A5%C3%CE/%C1%F5%C0%BC%B7%BC_%BA%EC%C2%A5%C3%CE_001.mp3"; count=108;
#sample_url = "http://down01.pingshu8.com:8000/1/ps/%C1%F5%C0%BC%B7%BC_%D5%D4%BF%EF%D8%B7%D1%DD%D2%E5/%C1%F5%C0%BC%B7%BC_%D5%D4%BF%EF%D8%B7%D1%DD%D2%E5_001.mp3"; count=100;
#sample_url = "http://down01.pingshu8.com:8000/2/ps/%C1%F5%C0%BC%B7%BC_%D0%C2%CB%AE%E4%B0%BA%F3%B4%AB/%C1%F5%C0%BC%B7%BC_%D0%C2%CB%AE%E4%B0%BA%F3%B4%AB_001.mp3"; count=160;
#sample_url = "http://down01.pingshu8.com:8000/1/ps/%C1%F5%C0%BC%B7%BC_%CE%E5%B7%EF%B3%AF%D1%F4%B5%B6/%C1%F5%C0%BC%B7%BC_%CE%E5%B7%EF%B3%AF%D1%F4%B5%B6_001.mp3"; count=110;
#sample_url = "http://down01.pingshu8.com:8000/3/ps/%C1%F5%C0%BC%B7%BC_%D6%D0%BB%AA%BA%C3%C8%CB%CB%CC/%C1%F5%C0%BC%B7%BC_%D6%D0%BB%AA%BA%C3%C8%CB%CB%CC_001.mp3"; count=105;
#sample_url = "http://down01.pingshu8.com:8000/3/ps/%C1%F5%C0%BC%B7%BC_%BB%B0%CB%B5%CC%A9%C9%BD/%C1%F5%C0%BC%B7%BC_%BB%B0%CB%B5%CC%A9%C9%BD_001.mp3"; count=100;
#sample_url = "http://down01.pingshu8.com:8000/1/ps/%C1%F5%C0%BC%B7%BC_%D0%C2%D4%C0%B7%C9%B4%AB/%C1%F5%C0%BC%B7%BC_%D0%C2%D4%C0%B7%C9%B4%AB_001.mp3"; count=161;
#sample_url = "http://down01.pingshu8.com:8000/3/ps/%C1%F5%C0%BC%B7%BC_%B7%E7%B3%BE%CF%C0%D2%E5%CD%BC/%C1%F5%C0%BC%B7%BC_%B7%E7%B3%BE%CF%C0%D2%E5%CD%BC_001.mp3"; count=97;
#sample_url = "http://down01.pingshu8.com:8000/2/ps/%CC%EF%C1%AC%D4%AA_%B0%FC%B9%AB%B0%B8/%CC%EF%C1%AC%D4%AA_%B0%FC%B9%AB%B0%B8_01.mp3"; count=90;
#sample_url = "http://down01.pingshu8.com:8000/1/ps/%CC%EF%C1%AC%D4%AA_%BA%A3%C7%E0%CC%EC/%CC%EF%C1%AC%D4%AA_%BA%A3%C7%E0%CC%EC_001.mp3"; count=35;
#sample_url = "http://down01.pingshu8.com:8000/3/ps/%CC%EF%C1%AC%D4%AA_%C8%FD%CF%C0%CE%E5%D2%E5/%CC%EF%C1%AC%D4%AA_%C8%FD%CF%C0%CE%E5%D2%E5_001.mp3"; count=100;
#sample_url = "http://down01.pingshu8.com:8000/1/ps/%CC%EF%C1%AC%D4%AA_%C1%F5%D0%E3%B4%AB/%CC%EF%C1%AC%D4%AA_%C1%F5%D0%E3%B4%AB_001.mp3"; count=70;
sample_urls = [
  ["http://down01.pingshu8.com:8000/1/ps/%C1%F5%C0%BC%B7%BC_%B0%D7%C4%B5%B5%A4%D0%D0%B6%AF_%B5%E7%CA%D3%B0%E6(60%BB%D8)/%C1%F5%C0%BC%B7%BC_%B0%D7%C4%B5%B5%A4%D0%D0%B6%AF_%B5%E7%CA%D3%B0%E6(60%BB%D8)_01.mp3", 60],
  ["http://down01.pingshu8.com:8000/1/ps/%C1%F5%C0%BC%B7%BC_%B4%F3%CC%C6%CF%C0%C5%AE/%C1%F5%C0%BC%B7%BC_%B4%F3%CC%C6%CF%C0%C5%AE_001.mp3", 62],
  ]

sample_urls.each do |pair|
  crawl_pingshu8_by_sample_url(pair[0], pair[1])
end