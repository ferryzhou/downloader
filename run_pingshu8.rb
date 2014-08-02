require_relative 'downloader'

#  'http://down1.pingshu8.com:8000/3/ps/%C1%F5%C0%BC%B7%BC_%C2%DE%C2%ED%BE%FC%CD%C5%CF%FB%CA%A7%D6%AE%C3%D5/%C1%F5%C0%BC%B7%BC_%C2%DE%C2%ED%BE%FC%CD%C5%CF%FB%CA%A7%D6%AE%C3%D5_001.mp3'

# 刘兰芳 -> %C1%F5%C0%BC%B7%BC
def cn_utf_to_gbk_url(name)
  URI.encode(name.encode('gbk'))
end

def crawl_pingshu8(name, count)

uname = cn_utf_to_gbk_url(name)
tasks = (1..count).collect { |i| "http://down1.pingshu8.com:8000/3/ps/#{uname}/#{uname}_#{'%03d' % i}.mp3" }

thread_count = 5;
archieves_root = File.join('results', name);

runner = Downloader.new(archieves_root, thread_count);
runner.run(tasks)
end

crawl_pingshu8('刘兰芳_罗马军团消失之谜', 67)