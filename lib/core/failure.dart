import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  const Failure([properties]);
  final List properties = const <dynamic>[];
  final String msg = "";

  @override
  List<Object> get props => [properties, msg];
}

class ServerFailure extends Failure {
  final String msg = "Server failure";

  @override
  List<Object> get props => [msg];
}

class CacheFailure extends Failure {
  const CacheFailure({this.msg = "Cache failure"});
  final String msg;

  @override
  List<Object> get props => [msg];
}

class ParsingFailure extends Failure {
  final String msg = "Parsing failure";

  @override
  List<Object> get props => [msg];
}

class SendOTPFailure extends Failure {
  const SendOTPFailure(this.msg);
  final String msg;

  @override
  List<Object> get props => [msg];
}

class VerifyOTPFailure extends Failure {
  const VerifyOTPFailure(this.msg);
  final String msg;

  @override
  List<Object> get props => [msg];
}

class AuthFailure extends Failure {
  const AuthFailure(this.msg);
  final String msg;

  @override
  List<Object> get props => [msg];
}
