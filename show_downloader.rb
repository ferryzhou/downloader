# encoding: UTF-8
require './tasks_runner'
require './url_task'

tasks = [
['分手快乐', 'http://api.ning.com/files/69dnaFh5bEl0ePTptkTXPK1nB5*2o1BH6r3XyO78r2-A7hTCkBu1x7AgVzY*hWXD7q23YqUeKosF4Yem1HhvnZ1a8rVMuYow/nWiKmaR6jFwx.mp3'],
['对不起我爱你', 'http://du.xmanyao.info/COFFdD0xMzM0NTMwNDg4Jmk9NzEuMTc4LjYwLjU0JnU9U29uZ3MvdjIvZmFpbnRRQy81Zi9kZi9kNjdlOWM3OWIzOTFmZmVlNzRjYzRmOWFkMmJhZGY1Zi5tcDMmbT0xZjQ0NjlhOTYzNDQzYjM1NjE3OWQ3MmI5Yzc4NDVkZSZ2PWRvd24mbj221LK7xvDO0rCuxOMmcz3Bur6yyOMmcD1u.mp3'],
];

thread_count = 2;
archieves_root = 'H:/Results/downloader';

runner = TasksRunner.new(archieves_root, 'mp3', thread_count);
runner.run(arrays_to_tasks(tasks))
