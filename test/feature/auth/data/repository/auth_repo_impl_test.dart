import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/exceptions.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/auth/data/models/user_model.dart';
import 'package:dhan_saarthi/feature/auth/data/respository/auth_repository_impl.dart';
import 'package:dhan_saarthi/feature/auth/domain/entities/phone_number.dart';
import 'package:dhan_saarthi/feature/auth/domain/entities/phone_otp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'mock_auth_remote.mocks.dart';

void main() {
  final mockRemoteSource = MockAuthRemote();
  final authRepo = AuthRepositoryImpl(mockRemoteSource);

  group("AuthRepositoryImpl Test", () {
    test("Send OTP success", () async {
      //assert
      when(mockRemoteSource.sendOTP(any)).thenAnswer((_) async => unit);
      //act
      final response = await authRepo.sendOTP(PhoneNumber("1234567890"));
      //verify or expect
      verify(mockRemoteSource.sendOTP(any));
      expect(response, Right(unit));
    });

    test("Send OTP failure", () async {
      //assert
      when(mockRemoteSource.sendOTP(any)).thenThrow(ServerException());
      //act
      final response = await authRepo.sendOTP(PhoneNumber("1234567890"));
      //verify or expect
      verify(mockRemoteSource.sendOTP(any));
      expect(response, Left(ServerFailure()));
    });
  });

  test("Verify OTP success", () async {
    //assert
    final user = UserModel(id: "1", phoneNo: "1234567890");
    when(mockRemoteSource.verifyOTP(any,any)).thenAnswer((_) async => user);
    //act
    final response = await authRepo.verifyOTP(PhoneOTP(otp: "123456"),PhoneNumber("8476732876"));
    //verify or expect
    verify(mockRemoteSource.verifyOTP(any,any));
    expect(response, Right(user));
  });

  test("Verify OTP failure", () async {
    //assert
    when(mockRemoteSource.verifyOTP(any,any)).thenThrow(ServerException());
    //act
    final response = await authRepo.verifyOTP(PhoneOTP(otp: "123456"),PhoneNumber("8476732876"));
    //verify or expect
    verify(mockRemoteSource.verifyOTP(any,any));
    expect(response, Left(ServerFailure()));
  });

  test("Signout success", () async {
    //assert
    when(mockRemoteSource.signOut()).thenAnswer((_) async => unit);
    //act
    final response = await authRepo.signOut();
    //verify or expect
    verify(mockRemoteSource.signOut());
    expect(response, Right(unit));
  });

  test("Signout failure", () async {
    //assert
    when(mockRemoteSource.signOut()).thenThrow(ServerException());
    //act
    final response = await authRepo.signOut();
    //verify or expect
    verify(mockRemoteSource.signOut());
    expect(response, Left(ServerFailure()));
  });

  test("Current user Succes", () async {
    //assert
    final user = UserModel(id: "1", phoneNo: "1234567890");
    when(mockRemoteSource.currentUser()).thenReturn(user);
    //act
    final response = authRepo.currentuser();
    //verify or expect
    verify(mockRemoteSource.currentUser());
    expect(response, Right(user));
  });

  test("Current user auth faiture", () async {
    //assert
    when(mockRemoteSource.currentUser()).thenThrow(AuthException("user null"));
    //act
    final response = authRepo.currentuser();
    //verify or expect
    verify(mockRemoteSource.currentUser());
    expect(response, Left(AuthFailure("user null")));
  });
  test("Current user server failed", () async {
    //assert
    when(mockRemoteSource.currentUser()).thenThrow(ServerException());
    //act
    final response = authRepo.currentuser();
    //verify or expect
    verify(mockRemoteSource.currentUser());
    expect(response, Left(ServerFailure()));
  });
}
