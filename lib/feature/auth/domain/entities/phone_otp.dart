import 'package:equatable/equatable.dart';

/// Phone OTP Object [PhoneOTP] contain [otp]
class PhoneOTP extends Equatable {
  final String otp;
  const PhoneOTP({required this.otp});

  @override
  List<Object?> get props => [otp];
}
