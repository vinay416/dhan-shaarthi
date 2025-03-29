import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/auth/domain/entities/phone_number.dart';
import 'package:dhan_saarthi/feature/auth/domain/entities/phone_otp.dart';
import 'package:dhan_saarthi/feature/auth/domain/entities/user_entity.dart';
import 'package:dhan_saarthi/feature/auth/domain/usecase/current_user_auth.dart';
import 'package:dhan_saarthi/feature/auth/domain/usecase/send_otp_auth.dart';
import 'package:dhan_saarthi/feature/auth/domain/usecase/sign_out_auth.dart';
import 'package:dhan_saarthi/feature/auth/domain/usecase/verify_otp_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mock_auth_repo.mocks.dart';

void main() {
  final mockRepo = MockMyAuthRepo();
  final sendOtp = SendOtpAuth(auth: mockRepo);
  final verifyOtp = VerifyOtpAuth(auth: mockRepo);
  final signOut = SignOutAuth(auth: mockRepo);
  final currentUser = CurrentUserAuth(auth: mockRepo);

  group("Auth Repo", () {
    test("Send OTP Success", () async {
      //assert
      when(mockRepo.sendOTP(any)).thenAnswer((_) async => Right(unit));
      //act
      final response = await sendOtp.call(PhoneNumber("8476732876"));
      //verify or expect
      verify(mockRepo.sendOTP(any));
      expect(response, Right(unit));
    });

    test("Send OTP Failure", () async {
      //assert
      when(
        mockRepo.sendOTP(any),
      ).thenAnswer((_) async => Left(ServerFailure()));
      //act
      final response = await sendOtp.call(PhoneNumber("8476732876"));
      //verify or expect
      verify(mockRepo.sendOTP(any));
      expect(response, Left(ServerFailure()));
    });

    test("Verify OTP Success", () async {
      //assert
      final userEntity = UserEntity(id: "1", phoneNo: "8476732876");
      when(mockRepo.verifyOTP(any,any)).thenAnswer((_) async => Right(userEntity));
      //act
      final response = await verifyOtp.call(PhoneOTP(otp: "123456"), PhoneNumber("8476732876"));
      //verify or expect
      verify(mockRepo.verifyOTP(any,any));
      expect(response, Right(userEntity));
    });

    test("Verify OTP Failure", () async {
      //assert
      when(
        mockRepo.verifyOTP(any,any),
      ).thenAnswer((_) async => Left(ServerFailure()));
      //act
      final response = await verifyOtp.call(PhoneOTP(otp: "123456"), PhoneNumber("8476732876"));
      //verify or expect
      verify(mockRepo.verifyOTP(any,any));
      expect(response, Left(ServerFailure()));
    });

    test("Signout Success", () async {
      //assert
      when(mockRepo.signOut()).thenAnswer((_) async => Right(unit));
      //act
      final response = await signOut.call();
      //verify or expect
      verify(mockRepo.signOut());
      expect(response, Right(unit));
    });

    test("Signout Failure", () async {
      //assert
      when(mockRepo.signOut()).thenAnswer((_) async => Left(ServerFailure()));
      //act
      final response = await signOut.call();
      //verify or expect
      verify(mockRepo.signOut());
      expect(response, Left(ServerFailure()));
    });

    test("Current User Success", () async {
      //assert
      final userEntity = UserEntity(id: "1", phoneNo: "8476732876");
      when(mockRepo.currentuser()).thenReturn(Right(userEntity));
      //act
      final response = currentUser.user;
      //verify or expect
      verify(mockRepo.currentuser());
      expect(response, true);
    });

    test("Current User failed/Null", () async {
      //assert
      when(
        mockRepo.currentuser(),
      ).thenReturn(Left(AuthFailure("user not found")));
      //act
      final response = currentUser.user;
      //verify or expect
      verify(mockRepo.currentuser());
      expect(response, false);
    });
  });
}
