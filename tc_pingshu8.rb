require_relative "pingshu8"
require "test/unit"

class TestTasksFromSampleUrl < Test::Unit::TestCase

def test_tasks
  tc = ['http://down1.pingshu8.com:8000/3/ps/%C1%F5%C0%BC%B7%BC_%C2%DE%C2%ED%BE%FC%CD%C5%CF%FB%CA%A7%D6%AE%C3%D5/%C1%F5%C0%BC%B7%BC_%C2%DE%C2%ED%BE%FC%CD%C5%CF%FB%CA%A7%D6%AE%C3%D5_001.mp3', 20]
  tasks, count = tasks_from_sample_url(tc[0], tc[1])
  assert_equal(20, tasks.size)
  assert_equal('http://down1.pingshu8.com:8000/3/ps/%C1%F5%C0%BC%B7%BC_%C2%DE%C2%ED%BE%FC%CD%C5%CF%FB%CA%A7%D6%AE%C3%D5/%C1%F5%C0%BC%B7%BC_%C2%DE%C2%ED%BE%FC%CD%C5%CF%FB%CA%A7%D6%AE%C3%D5_002.mp3', tasks[1])
end

def test_tasks2
  tc = ['http://down02.pingshu8.com:8000/02/ys/%CF%E3%B2%DD%C3%C0%C8%CB%B5%CB%C0%F6%BE%FD/%CF%E3%B2%DD%C3%C0%C8%CB%B5%CB%C0%F6%BE%FD_01-05.mp3', 79]
  tasks, count = tasks_from_sample_url(tc[0], tc[1])
  assert_equal(16, tasks.size)
  assert_equal('http://down02.pingshu8.com:8000/02/ys/%CF%E3%B2%DD%C3%C0%C8%CB%B5%CB%C0%F6%BE%FD/%CF%E3%B2%DD%C3%C0%C8%CB%B5%CB%C0%F6%BE%FD_06-10.mp3', tasks[1])
  assert_equal('http://down02.pingshu8.com:8000/02/ys/%CF%E3%B2%DD%C3%C0%C8%CB%B5%CB%C0%F6%BE%FD/%CF%E3%B2%DD%C3%C0%C8%CB%B5%CB%C0%F6%BE%FD_76-79.mp3', tasks[15])
end

end
