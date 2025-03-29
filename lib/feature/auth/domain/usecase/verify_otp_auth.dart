import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/auth/domain/entities/phone_number.dart';
import 'package:dhan_saarthi/feature/auth/domain/entities/phone_otp.dart';
import 'package:dhan_saarthi/feature/auth/domain/entities/user_entity.dart';
import 'package:dhan_saarthi/feature/auth/domain/repository/auth_repository.dart';

class VerifyOtpAuth {
  final AuthRepository auth;
  const VerifyOtpAuth({required this.auth});

  Future<Either<Failure, UserEntity>> call(
    PhoneOTP otp,
    PhoneNumber phone,
  ) async {
    return await auth.verifyOTP(otp, phone);
  }
}
