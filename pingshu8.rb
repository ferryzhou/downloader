require 'uri'

# 刘兰芳 -> %C1%F5%C0%BC%B7%BC
def cn_utf_to_gbk_url(name)
  URI.encode(name.encode('gbk'))
end

def gbk_url_to_cn_utf(url)
  URI.decode(url).force_encoding('gbk').encode("utf-8")
end

# 'http://down1.pingshu8.com:8000/3/ps/<encoded_name>_001.mp3', 80
# -> ['http://down1.pingshu8.com:8000/3/ps/<encoded_name>_001.mp3',
#     'http://down1.pingshu8.com:8000/3/ps/<encoded_name>_002.mp3',
#     ...
#     'http://down1.pingshu8.com:8000/3/ps/<encoded_name>_079.mp3']
#
# 'http://down02.pingshu8.com:8000/02/ys/<encoded_name>_01-05.mp3', 80
# -> ['http://down02.pingshu8.com:8000/02/ys/<encoded_name>_01-05.mp3',
#     'http://down02.pingshu8.com:8000/02/ys/<encoded_name>_06-10.mp3',
#     ...
#     'http://down02.pingshu8.com:8000/02/ys/<encoded_name>_76-80.mp3']
#
# <encoded_name> -> <utf_name>
def tasks_from_sample_url(sample_url, count)
  basename = File.basename(sample_url, ".mp3")
  full_name = gbk_url_to_cn_utf(basename)

  index = full_name.rindex('_')
  if index == nil
    return [nil, nil]
  end

  name = full_name[0...index]
  num_str = full_name[index+1..-1]
  p "num_str: #{num_str}"
  base_url = sample_url[0...(-4 - num_str.size)]
  p 'base_url: ' + base_url

  tasks = []

  dash_index = num_str.index('-')
  if dash_index == nil
    format = "%0#{num_str.size}d"
    tasks = (1..count).collect { |i| base_url + format % i + ".mp3" }
  else
    format = "%0#{(num_str.size-1)/2}d"
    p "format: #{format}"
    ind1 = num_str[0...dash_index].to_i
    ind2 = num_str[(dash_index+1)..-1].to_i
    interval = ind2 - ind1 + 1
    n = (count / interval).floor
    p "n: #{n}"
    tasks = (0..n).collect do |i|
      from = i*interval + 1
      to = [(i+1)*interval, count].min
      base_url + format % from + "-" + format % to + ".mp3"
    end
  end
  return [tasks, name]
end
