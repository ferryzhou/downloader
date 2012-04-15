require './thread_pool'
require './url_archiever'

class TasksRunner

  def initialize(archieves_root, extension, thread_count = 10)
	@archiever = UrlArchiever.new(archieves_root, extension)
	@thread_count = thread_count
  end
  
  def run(task_array)
    read_and_save_page_tasks(task_array, @thread_count)
  end
  
  def read_and_save_page_tasks(task_array, thread_count)
    pool = ThreadPool.new(thread_count)
    task_array.each do |page_task| 
      pool.process {@archiever.read_and_save_url(page_task.url, page_task.name)} 
    end
    pool.join()
  end

end
