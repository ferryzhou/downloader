require_relative 'downloader'
require_relative 'pingshu8'


def crawl_all(tasks, name)
  thread_count = 5;
  archieves_root = File.join('results', name);

  runner = Downloader.new(archieves_root, thread_count);
  runner.run(tasks)
end

def crawl_pingshu8_by_sample_url(sample_url, count)
  tasks, name = tasks_from_sample_url(sample_url, count)
  if tasks.nil?
    p "failed to decode sample url"
    return
  end
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
#  ["http://down01.pingshu8.com:8000/1/ps/%C1%F5%C0%BC%B7%BC_%B0%D7%C4%B5%B5%A4%D0%D0%B6%AF_%B5%E7%CA%D3%B0%E6(60%BB%D8)/%C1%F5%C0%BC%B7%BC_%B0%D7%C4%B5%B5%A4%D0%D0%B6%AF_%B5%E7%CA%D3%B0%E6(60%BB%D8)_01.mp3", 60],
#  ["http://down01.pingshu8.com:8000/1/ps/%C1%F5%C0%BC%B7%BC_%B4%F3%CC%C6%CF%C0%C5%AE/%C1%F5%C0%BC%B7%BC_%B4%F3%CC%C6%CF%C0%C5%AE_001.mp3", 62],
#  ["http://down01.pingshu8.com:8000/2/ps/%CC%EF%C1%AC%D4%AA_%B4%F3%BB%B0%B3%C9%D3%EF/%CC%EF%C1%AC%D4%AA_%B4%F3%BB%B0%B3%C9%D3%EF_001.mp3", 300],
#  ["http://down02.pingshu8.com:8000/02/ps/%CC%EF%C1%AC%D4%AA_%CB%AE%E4%B0%C8%CB%CE%EF%B4%AB(297%BB%D8)/%CC%EF%C1%AC%D4%AA_%CB%AE%E4%B0%C8%CB%CE%EF%B4%AB_001.mp3", 297],
#  ["http://down01.pingshu8.com:8000/2/ps/%CC%EF%C1%AC%D4%AA_%CB%AE%E4%B0(220%BB%D8)/%CC%EF%C1%AC%D4%AA_%CB%AE%E4%B0_001.mp3", 220],
#  ["http://down01.pingshu8.com:8000/3/ps/%CC%EF%C1%AC%D4%AA_%D0%A1%B0%CB%D2%E5(27%BB%D8)/%CC%EF%C1%AC%D4%AA_%D0%A1%B0%CB%D2%E5_01.mp3", 106],
#  ["http://down03.pingshu8.com:8000/03/ps/%CC%EF%C1%AC%D4%AA_%D0%A1%B0%CB%D2%E5(27%BB%D8)/%CC%EF%C1%AC%D4%AA_%D0%A1%B0%CB%D2%E5_01.mp3", 106],
#  ["http://down03.pingshu8.com:8000/03/ps/%CC%EF%C1%AC%D4%AA_%D0%A1%B0%CB%D2%E5-%CF%C2%B2%BF/%CC%EF%C1%AC%D4%AA_%D0%A1%B0%CB%D2%E5-%CF%C2%B2%BF_001.mp3", 75],
#  ["http://down03.pingshu8.com:8000/03/ps/%CC%EF%C1%AC%D4%AA_%D0%A1%B0%CB%D2%E5%D0%F8%BC%AF/%CC%EF%C1%AC%D4%AA_%D0%A1%B0%CB%D2%E5%D0%F8%BC%AF_001.mp3", 39],
#  ["http://down01.pingshu8.com:8000/1/ps/%CC%EF%C1%AC%D4%AA_%D1%EE%BC%D2%BD%AB/%CC%EF%C1%AC%D4%AA_%D1%EE%BC%D2%BD%AB_001.mp3", 102],
#  ["http://down01.pingshu8.com:8000/3/ps/%CC%EF%C1%AC%D4%AA_%B9%FA%C6%F3%B8%DF%B9%DC%CC%B0%B8%AF%C1%D0%B4%AB/%CC%EF%C1%AC%D4%AA_%B9%FA%C6%F3%B8%DF%B9%DC%CC%B0%B8%AF%C1%D0%B4%AB_01.mp3", 10],
# ["http://down02.pingshu8.com:8000/02/ys/%D5%E2%B2%C5%CA%C7%D4%C0%B7%C9(55%BC%AF)/%D5%E2%B2%C5%CA%C7%D4%C0%B7%C9_01.mp3", 55],
# ["http://down02.pingshu8.com:8000/02/ys/%D7%F3%D7%DA%CC%C4%B7%A2%BC%A3%CA%B7(85%BC%AF)/%D7%F3%D7%DA%CC%C4%B7%A2%BC%A3%CA%B7_01.mp3", 85],
# ["http://down02.pingshu8.com:8000/02/ys/%C8%A8%C1%A6%D2%B0%CA%DE%D6%EC%D4%AA%E8%B01(45%BC%AF)/%C8%A8%C1%A6%D2%B0%CA%DE%D6%EC%D4%AA%E8%B01_01.mp3", 45],
# ["http://down02.pingshu8.com:8000/02/ys/%C8%A8%C1%A6%D2%B0%CA%DE%D6%EC%D4%AA%E8%B02(50%BC%AF)/%C8%A8%C1%A6%D2%B0%CA%DE%D6%EC%D4%AA%E8%B02_01.mp3", 50],
# ["http://down01.pingshu8.com:8000/1/ys/%C3%FB%BD%AB%CB%DA%D4%A3%D5%E4%CE%C5%C2%BC(32%BC%AF)/%C3%FB%BD%AB%CB%DA%D4%A3%D5%E4%CE%C5%C2%BC_01.mp3", 32],
# ["http://down01.pingshu8.com:8000/1/ys/%BE%F8%CF%EC%A3%BA%D3%C0%D4%B6%B5%C4%B5%CB%C0%F6%BE%FD(15%BC%AF)/%BE%F8%CF%EC%A3%BA%D3%C0%D4%B6%B5%C4%B5%CB%C0%F6%BE%FD_01.mp3", 14],
# ["http://down01.pingshu8.com:8000/3/ys/%B3%D9%BA%C6%CC%EF%B4%AB(64%BC%AF)/%B3%D9%BA%C6%CC%EF%B4%AB_01.mp3", 64],
# ["http://down01.pingshu8.com:8000/3/ys/%B6%C0%D7%D4%C9%CF%B3%A1-%C0%EE%C4%C8%D7%D4%B4%AB(25%BC%AF)/%B6%C0%D7%D4%C9%CF%B3%A1-%C0%EE%C4%C8%D7%D4%B4%AB_01.mp3", 25],
# ["http://down01.pingshu8.com:8000/3/ys/%CE%E5%B2%BF%CA%CC%C0%C9%D4%F8%B9%FA%B7%AA(100%BC%AF)/%CE%E5%B2%BF%CA%CC%C0%C9%D4%F8%B9%FA%B7%AA_001.mp3", 100],
# ["http://down01.pingshu8.com:8000/2/ys/%D5%C5%D6%AE%B6%B4/%D5%C5%D6%AE%B6%B4_01.mp3", 72],
# ["http://down01.pingshu8.com:8000/2/ys/%B1%F9%D0%C4%B4%AB/%B1%F9%D0%C4%B4%AB_01.mp3", 65],
# ["http://down02.pingshu8.com:8000/02/ys/%CB%EF%CE%E4%B4%AB%C6%E6/%CB%EF%CE%E4%B4%AB%C6%E6_001.mp3", 100],
# ["http://down01.pingshu8.com:8000/1/ys/%BD%E2%B6%C1%BA%FA%D2%AB%B0%EE/%BD%E2%B6%C1%BA%FA%D2%AB%B0%EE_001.mp3", 37],
# ["http://down01.pingshu8.com:8000/1/ys/%BD%AD%D4%F3%C3%F1%B4%AB/%BD%AD%D4%F3%C3%F1%B4%AB_001.mp3", 70],
# ["http://down02.pingshu8.com:8000/02/ys/%C0%EE%B4%F3%EE%C8/%C0%EE%B4%F3%EE%C8_01.mp3", 78],
# ["http://down01.pingshu8.com:8000/1/ys/%C1%C1%BD%A3/%C1%C1%BD%A3_001.mp3", 82],
# ["http://down01.pingshu8.com:8000/1/ys/%C1%D6%B1%EB%D5%E2%D2%BB%C9%FA/%C1%D6%B1%EB%D5%E2%D2%BB%C9%FA_001.mp3", 24],
# ["http://down01.pingshu8.com:8000/1/ys/%D2%BB%B4%FA%C3%FB%BC%CB%C8%FC%BD%F0%BB%A8%B4%AB/%D2%BB%B4%FA%C3%FB%BC%CB%C8%FC%BD%F0%BB%A8%B4%AB_001.mp3", 50],
# ["http://down01.pingshu8.com:8000/1/ys/%CE%D2%B5%C4%B8%B8%C7%D7%B5%CB%D0%A1%C6%BD/%CE%D2%B5%C4%B8%B8%C7%D7%B5%CB%D0%A1%C6%BD_01.mp3", 58]
# ["http://down01.pingshu8.com:8000/1/ys/%CA%A5%BE%AD%B9%CA%CA%C2-%BE%C9%D4%BC/%CA%A5%BE%AD%B9%CA%CA%C2-%BE%C9%D4%BC_001.mp3", 150],
# ["http://down01.pingshu8.com:8000/1/ys/%CA%A5%BE%AD%B9%CA%CA%C2-%D0%C2%D4%BC/%CA%A5%BE%AD%B9%CA%CA%C2-%D0%C2%D4%BC_001.mp3", 120],
["http://down03.pingshu8.com:8000/03/ys/%C3%AB%D4%F3%B6%AB(12%BC%AF)/01.%B7%E1%B1%AE%D4%DA%C8%CB%C3%F1%D0%C4%D6%D0.mp3", 12]
  ]

sample_urls.each do |pair|
  crawl_pingshu8_by_sample_url(pair[0], pair[1])
end