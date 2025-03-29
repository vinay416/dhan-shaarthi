part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class InitialAuth extends AuthEvent {}

final class SendOTP extends AuthEvent {
  const SendOTP(this.phoneNumber);
  final PhoneNumber phoneNumber;
  @override
  List<Object> get props => [phoneNumber];
}

final class VerifyOTP extends AuthEvent {
  final PhoneNumber phone;
  const VerifyOTP(this.phoneOTP, this.phone);
  final PhoneOTP phoneOTP;
  @override
  List<Object> get props => [phoneOTP, phone];
}

final class ResendOTP extends AuthEvent {
  final PhoneNumber phone;
  const ResendOTP(this.phone);
  @override
  List<Object> get props => [phone];
}

final class SignOutEvent extends AuthEvent {}
