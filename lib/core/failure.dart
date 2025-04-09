// ignore_for_file: overridden_fields

import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  const Failure([properties]);
  final List properties = const <dynamic>[];
  final String msg = "";

  @override
  List<Object> get props => [properties, msg];
}

class ServerFailure extends Failure {
  @override
  final String msg = "Server failure";

  @override
  List<Object> get props => [msg];
}

class CacheFailure extends Failure {
  const CacheFailure({this.msg = "Cache failure"});
  @override
  final String msg;

  @override
  List<Object> get props => [msg];
}

class ParsingFailure extends Failure {
  @override
  final String msg = "Parsing failure";

  @override
  List<Object> get props => [msg];
}

class SendOTPFailure extends Failure {
  const SendOTPFailure(this.msg);
  @override
  final String msg;

  @override
  List<Object> get props => [msg];
}

class VerifyOTPFailure extends Failure {
  const VerifyOTPFailure(this.msg);
  @override
  final String msg;

  @override
  List<Object> get props => [msg];
}

class AuthFailure extends Failure {
  const AuthFailure(this.msg);
  @override
  final String msg;

  @override
  List<Object> get props => [msg];
}
