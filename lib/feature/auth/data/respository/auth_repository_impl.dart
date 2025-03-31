// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/auth/data/data_sources/auth_remote_source.dart';
import 'package:dhan_saarthi/feature/auth/domain/entities/phone_number.dart';
import 'package:dhan_saarthi/feature/auth/domain/entities/phone_otp.dart';
import 'package:dhan_saarthi/feature/auth/domain/entities/user_entity.dart';
import 'package:dhan_saarthi/feature/auth/domain/repository/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource authRemoteSource;
  const AuthRepositoryImpl(this.authRemoteSource);

  @override
  Future<Either<Failure, Unit>> sendOTP(PhoneNumber phoneNo) async {
    try {
      final phoneNumber = phoneNo.countryCode + phoneNo.number;
      await authRemoteSource.sendOTP(phoneNumber);
      return Right(unit);
    } on AuthException catch (e) {
      return Left(SendOTPFailure(e.message));
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> verifyOTP(
    PhoneOTP otp,
    PhoneNumber phone,
  ) async {
    try {
      final phoneNumber = phone.countryCode + phone.number;
      final user = await authRemoteSource.verifyOTP(otp.otp, phoneNumber);
      return Right(user);
    } on AuthException catch (e) {
      return Left(VerifyOTPFailure(e.message));
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await authRemoteSource.signOut();
      return Right(unit);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Either<Failure, UserEntity> currentuser() {
    try {
      final user = authRemoteSource.currentUser();
      return Right(user);
    } on AuthException catch (e) {
      return Left(AuthFailure(e.message));
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
