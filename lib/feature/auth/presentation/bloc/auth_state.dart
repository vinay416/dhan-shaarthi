part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

/// Signup/SignIn [UnAuthenticated] Phone no. input state
final class UnAuthenticated extends AuthState {
  const UnAuthenticated(this.phone);
  final PhoneNumber phone;
  @override
  List<Object?> get props => [phone];
}

final class SendingOTP extends AuthState {}

/// Signup/SignIn [VerifyAuth] OTP input state
final class VerifyAuth extends AuthState {
  const VerifyAuth({required this.phone, required this.otp});
  final PhoneNumber phone;
  final PhoneOTP otp;
  @override
  List<Object> get props => [phone, otp];
}

final class VerifyingAuth extends AuthState {}

final class VerifyingAuthFailed extends AuthState {}

final class ResendVerifyAuth extends AuthState {}

final class Authenticated extends AuthState {}

final class SigningOut extends AuthState {
  const SigningOut({required this.loading});
  final bool loading;

  @override
  List<Object> get props => [loading];
}

final class SignedOut extends AuthState {}
