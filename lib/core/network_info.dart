import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();
}

class NetworkInfoImpl implements NetworkInfo {
  const NetworkInfoImpl(this.networkChecker);
  final InternetConnectionChecker networkChecker;

  @override
  Future<bool> isConnected() {
    return networkChecker.hasConnection;
  }
}
