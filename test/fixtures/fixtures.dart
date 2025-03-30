import 'dart:io';

class Fixtures {
  String call(String path){
    return File("test/fixtures/$path").readAsStringSync();
  }
}