class ServerException implements Exception {}

class CacheException implements Exception {
  CacheException({this.msg});
  final String? msg;
}
