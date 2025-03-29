import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/auth/data/models/user_model.dart';

import 'package:dhan_saarthi/feature/auth/domain/entities/phone_number.dart';
import 'package:dhan_saarthi/feature/auth/domain/entities/phone_otp.dart';
import 'package:dhan_saarthi/feature/auth/domain/usecase/send_otp_auth.dart';
import 'package:dhan_saarthi/feature/auth/domain/usecase/sign_out_auth.dart';
import 'package:dhan_saarthi/feature/auth/domain/usecase/verify_otp_auth.dart';
import 'package:dhan_saarthi/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../core/flutter_toast/mock_flutter_toast.mocks.dart';
import 'mock_auth_repo_impl.mocks.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final mockToast = MockToast();
  setUp(() {
    when(mockToast.cancelToast()).thenAnswer((_) async => true);
    when(mockToast.show(any)).thenAnswer((_) async => true);
  });
  final authMock = MockMyAuthRepoImpl();
  final currentAuthMock = MockMyCurrentUserAuth();
  when(currentAuthMock.user).thenReturn(true);

  final bloc = AuthBloc(
    sendOtpAuth: SendOtpAuth(auth: authMock),
    verifyOtpAuth: VerifyOtpAuth(auth: authMock),
    currentUserAuth: currentAuthMock,
    signOutAuth: SignOutAuth(auth: authMock),
    toastHelper: mockToast,
  );

  group("Auth Bloc Test", () {
    test("Initial State when user exist", () {
      //assert
      when(currentAuthMock.user).thenReturn(true);
      //expect Later - bloc states
      final expected = [Authenticated()];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(InitialAuth());
    });

    test("Initial State when user null", () {
      //assert
      when(currentAuthMock.user).thenReturn(false);
      //expect Later - bloc states
      final expected = [];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(InitialAuth());
    });

    test("Send OTP Success", () async {
      //assert
      when(
        authMock.sendOTP(PhoneNumber("1234567890")),
      ).thenAnswer((_) async => Right(unit));
      //expect Later - bloc states
      final expected = [
        SendingOTP(),
        VerifyAuth(phone: PhoneNumber("1234567890"), otp: PhoneOTP(otp: "")),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(SendOTP(PhoneNumber("1234567890")));
      await untilCalled(authMock.sendOTP(PhoneNumber("1234567890")));
      //verify calls
      verify(authMock.sendOTP(PhoneNumber("1234567890")));
    });

    test("Send OTP Failed", () async {
      //assert
      when(
        authMock.sendOTP(PhoneNumber("1234567890")),
      ).thenAnswer((_) async => Left(AuthFailure("Auth failed")));
      //expect Later - bloc states
      final expected = [
        SendingOTP(),
        UnAuthenticated(PhoneNumber("1234567890")),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(SendOTP(PhoneNumber("1234567890")));
      await untilCalled(authMock.sendOTP(PhoneNumber("1234567890")));
      //verify calls
      verify(authMock.sendOTP(PhoneNumber("1234567890")));
    });

    test("ReSend OTP Success or Failure", () async {
      //assert
      when(
        authMock.sendOTP(PhoneNumber("1234567890")),
      ).thenAnswer((_) async => Right(unit));
      //expect Later - bloc states
      final expected = [ResendVerifyAuth()];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(ResendOTP(PhoneNumber("1234567890")));
      await untilCalled(authMock.sendOTP(PhoneNumber("1234567890")));
      //verify calls
      verify(authMock.sendOTP(PhoneNumber("1234567890")));
    });

    test("Verfiy OTP Success", () async {
      //assert
      final userModel = UserModel(id: "1", phoneNo: "1234567890");
      when(
        authMock.verifyOTP(PhoneOTP(otp: "123456"), PhoneNumber("1234567890")),
      ).thenAnswer((_) async => Right(userModel));
      //expect Later - bloc states
      final expected = [VerifyingAuth(), Authenticated()];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(VerifyOTP(PhoneOTP(otp: "123456"), PhoneNumber("1234567890")));
      await untilCalled(
        authMock.verifyOTP(PhoneOTP(otp: "123456"), PhoneNumber("1234567890")),
      );
      //verify calls
      verify(
        authMock.verifyOTP(PhoneOTP(otp: "123456"), PhoneNumber("1234567890")),
      );
    });

    test("Verfiy OTP Failed", () async {
      //assert
      when(
        authMock.verifyOTP(PhoneOTP(otp: "123456"), PhoneNumber("1234567890")),
      ).thenAnswer((_) async => Left(AuthFailure("wrong OTP")));
      //expect Later - bloc states
      final expected = [VerifyingAuth(), VerifyingAuthFailed()];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(VerifyOTP(PhoneOTP(otp: "123456"), PhoneNumber("1234567890")));
      await untilCalled(
        authMock.verifyOTP(PhoneOTP(otp: "123456"), PhoneNumber("1234567890")),
      );
      //verify calls
      verify(
        authMock.verifyOTP(PhoneOTP(otp: "123456"), PhoneNumber("1234567890")),
      );
    });

    test("Signout Success", () async {
      //assert
      when(authMock.signOut()).thenAnswer((_) async => Right(unit));
      //expect Later - bloc states
      final expected = [SigningOut(loading: true), SignedOut()];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(SignOutEvent());
      await untilCalled(authMock.signOut());
      //verify calls
      verify(authMock.signOut());
    });

    test("Signout failed", () async {
      //assert
      when(
        authMock.signOut(),
      ).thenAnswer((_) async => Left(AuthFailure("null user")));
      //expect Later - bloc states
      final expected = [SigningOut(loading: true), SigningOut(loading: false)];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(SignOutEvent());
      await untilCalled(authMock.signOut());
      //verify calls
      verify(authMock.signOut());
    });
  });
}
