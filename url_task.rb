class UrlTask
  attr_accessor :name, :url
	
  def initialize(name, url)
    @name = name
	@url = url
  end
	
  def to_s
    "[%s] - %s \n" % [@name, @url]
  end
  
end

def array_to_task(array)
  UrlTask.new(array[0], array[1])
end

def arrays_to_tasks(arrays)
  arrays.collect {|x| array_to_task(x)}
end
