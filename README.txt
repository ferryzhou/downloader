given a set of links (or with names)
download all the content
tested with ruby 2.0

features:
- multi-thread
- auto extract filenames
- handle non-ascii characters in filenames


tasks = [
  'http://down1.pingshu8.com:8000/3/ps/%C1%F5%C0%BC%B7%BC_%C2%DE%C2%ED%BE%FC%CD%C5%CF%FB%CA%A7%D6%AE%C3%D5/%C1%F5%C0%BC%B7%BC_%C2%DE%C2%ED%BE%FC%CD%C5%CF%FB%CA%A7%D6%AE%C3%D5_001.mp3'
];

thread_count = 2;
archieves_root = 'results';

runner = Downloader.new(archieves_root, thread_count);
runner.run(tasks)
