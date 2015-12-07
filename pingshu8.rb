require 'uri'

# 刘兰芳 -> %C1%F5%C0%BC%B7%BC
def cn_utf_to_gbk_url(name)
  URI.encode(name.encode('gbk'))
end

def gbk_url_to_cn_utf(url)
  URI.decode(url).force_encoding('gbk').encode("utf-8")
end

def tasks_from_sample_url(sample_url, count)
  basename = File.basename(sample_url, ".mp3")
  full_name = gbk_url_to_cn_utf(basename)
  
  # 'http://down1.pingshu8.com:8000/3/ps/%C1%F5%C0%BC%B7%BC_%C2%DE%C2%ED%BE%FC%CD%C5%CF%FB%CA%A7%D6%AE%C3%D5/%C1%F5%C0%BC%B7%BC_%C2%DE%C2%ED%BE%FC%CD%C5%CF%FB%CA%A7%D6%AE%C3%D5_001.mp3'
  index = full_name.rindex('_')
  if index != nil
    name = full_name[0...index]
    num_str = full_name[index+1..-1]
    p "num_str: #{num_str}"
    format = "%0#{num_str.size}d"
    base_url = sample_url[0...(-4 - num_str.size)]
    p 'base_url: ' + base_url
    tasks = (1..count).collect { |i| base_url + format % i + ".mp3" }
    return [tasks, name]
  end
  
  #"http://down03.pingshu8.com:8000/03/ys/%C3%AB%D4%F3%B6%AB(12%BC%AF)/01.%B7%E1%B1%AE%D4%DA%C8%CB%C3%F1%D0%C4%D6%D0.mp3"
#  index = full_name.index('.')
#  if index != nil
#    name = full_name[index+1..-1]
#    num_size = index
#    dirname = File.dirname(sample_url)
#    num_format = "%0#{num_size}d"
#    tasks = (1..count).collect { |i| "#{dirname}/#{num_format % i}.#{basename[index+1..-1]}.mp3" }
#    return [tasks, name]
#  end
  
  [nil, nil]
end
