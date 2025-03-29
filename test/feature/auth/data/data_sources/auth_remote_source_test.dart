import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/exceptions.dart';
import 'package:dhan_saarthi/feature/auth/data/data_sources/auth_remote_source.dart';
import 'package:dhan_saarthi/feature/auth/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'mock_supabse.mocks.dart';

void main() async {
  final mockSupabaseAuth = MockMySupabase();
  final authRemote = AuthRemoteSourceImpl(mockSupabaseAuth);

  group("Auth Remote Source", () {
    test("Send Otp success", () async {
      // Arrange
      when(
        mockSupabaseAuth.signInWithOtp(phone: anyNamed('phone')),
      ).thenAnswer((_) async => unit);
      // Act
      await authRemote.sendOTP("1234567890");
      // Verify
      verify(mockSupabaseAuth.signInWithOtp(phone: anyNamed('phone')));
    });

    test("Send Otp auth failed", () async {
      // Arrange
      when(
        mockSupabaseAuth.signInWithOtp(phone: anyNamed('phone')),
      ).thenThrow(AuthException("Auth failed"));
      // Act
      final call = authRemote.sendOTP("1234567890");
      // Verify
      expect(() async => await call, throwsA(TypeMatcher<AuthException>()));
      verify(mockSupabaseAuth.signInWithOtp(phone: anyNamed('phone')));
    });

    test("Send Otp server failed", () async {
      // Arrange
      when(
        mockSupabaseAuth.signInWithOtp(phone: anyNamed('phone')),
      ).thenThrow(Exception());
      // Act
      final call = authRemote.sendOTP("1234567890");
      // Verify
      expect(() async => await call, throwsA(TypeMatcher<ServerException>()));
      verify(mockSupabaseAuth.signInWithOtp(phone: anyNamed('phone')));
    });

    test("Verify Otp success", () async {
      // Arrange
      final authUser = User(
        id: "1",
        appMetadata: {},
        userMetadata: {},
        aud: "aud",
        createdAt: "createdAt",
      );
      final authResponse = AuthResponse(
        session: Session(
          accessToken: "accessToken",
          tokenType: "tokenType",
          user: authUser,
        ),
        user: authUser,
      );
      when(
        mockSupabaseAuth.verifyOTP(
          type: anyNamed('type'),
          token: anyNamed('token'),
        ),
      ).thenAnswer((_) async => authResponse);
      // Act
      await authRemote.verifyOTP("123456", "1234567890");
      // Verify
      verify(
        mockSupabaseAuth.verifyOTP(
          type: anyNamed('type'),
          token: anyNamed('token'),
        ),
      );
    });

    test("Verify Otp auth failed", () async {
      // Arrange
      when(
        mockSupabaseAuth.verifyOTP(
          type: anyNamed('type'),
          token: anyNamed('token'),
        ),
      ).thenThrow(AuthException("Verify failed"));
      // Act
      final call = authRemote.verifyOTP("123456", "1234567890");
      // Verify
      verify(
        mockSupabaseAuth.verifyOTP(
          type: anyNamed('type'),
          token: anyNamed('token'),
        ),
      );
      expect(call, throwsA(TypeMatcher<AuthException>()));
    });

    test("Verify Otp server failed", () async {
      // Arrange
      when(
        mockSupabaseAuth.verifyOTP(
          type: anyNamed('type'),
          token: anyNamed('token'),
        ),
      ).thenThrow(ServerException());
      // Act
      final call = authRemote.verifyOTP("123456","1234567890");
      // Verify
      verify(
        mockSupabaseAuth.verifyOTP(
          type: anyNamed('type'),
          token: anyNamed('token'),
        ),
      );
      expect(call, throwsA(TypeMatcher<ServerException>()));
    });

    test("Signout success", () async {
      //assert
      when(mockSupabaseAuth.signOut()).thenAnswer((_) async => unit);
      //act
      await authRemote.signOut();
      //verify or expect
      verify(mockSupabaseAuth.signOut());
    });

    test("Signout auth failed", () async {
      //assert
      when(
        mockSupabaseAuth.signOut(),
      ).thenThrow(AuthException("Signout failed"));
      //act
      final call = authRemote.signOut();
      //verify or expect
      verify(mockSupabaseAuth.signOut());
      expect(call, throwsA(TypeMatcher<AuthException>()));
    });

    test("Signout server failed", () async {
      //assert
      when(mockSupabaseAuth.signOut()).thenThrow(ServerException());
      //act
      final call = authRemote.signOut();
      //verify or expect
      verify(mockSupabaseAuth.signOut());
      expect(call, throwsA(TypeMatcher<ServerException>()));
    });

    test("Current user success", () async {
      //assert
      final authUser = User(
        id: "1",
        appMetadata: {},
        userMetadata: {},
        aud: "aud",
        createdAt: "createdAt",
      );
      when(mockSupabaseAuth.currentUser).thenReturn(authUser);
      //act
      final response = authRemote.currentUser();
      //verify or expect
      verify(mockSupabaseAuth.currentUser);
      final userModel = UserModel.fromUser(authUser);
      expect(response, userModel);
    });

    test("Current user auth failed/null", () async {
      //assert
      when(
        mockSupabaseAuth.currentUser,
      ).thenThrow(AuthException("user not found"));
      //act
      final call = authRemote.currentUser();
      //verify or expect
      verify(mockSupabaseAuth.currentUser);
      expect(call, throwsA(TypeMatcher<AuthException>()));
    });

    test("Current user Server failed", () async {
      //assert
      when(mockSupabaseAuth.currentUser).thenThrow(ServerException());
      //act
      final call = authRemote.currentUser();
      //verify or expect
      verify(mockSupabaseAuth.currentUser);
      expect(call, throwsA(TypeMatcher<ServerException>()));
    });
  });
}
