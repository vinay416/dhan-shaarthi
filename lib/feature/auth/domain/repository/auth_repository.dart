import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/auth/domain/entities/phone_number.dart';
import 'package:dhan_saarthi/feature/auth/domain/entities/phone_otp.dart';
import 'package:dhan_saarthi/feature/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> sendOTP(PhoneNumber phoneNo);
  Future<Either<Failure, UserEntity>> verifyOTP(
    PhoneOTP otp,
    PhoneNumber phone,
  );
  Either<Failure, UserEntity> currentuser();
  Future<Either<Failure, Unit>> signOut();
}
