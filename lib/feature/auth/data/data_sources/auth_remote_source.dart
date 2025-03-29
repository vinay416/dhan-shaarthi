import 'package:dhan_saarthi/core/exceptions.dart';
import 'package:dhan_saarthi/feature/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteSource {
  Future<void> sendOTP(String phoneNo);
  Future<UserModel> verifyOTP(String otp, String phone);
  UserModel currentUser();
  Future<void> signOut();
}

class AuthRemoteSourceImpl implements AuthRemoteSource {
  final GoTrueClient supabaseAuth;
  AuthRemoteSourceImpl(this.supabaseAuth);

  @override
  Future<void> sendOTP(String phoneNo) async {
    try {
      await supabaseAuth.signInWithOtp(phone: phoneNo);
    } on AuthException catch (e) {
      throw AuthException(e.message);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> verifyOTP(String otp, String phone) async {
    try {
      final response = await supabaseAuth.verifyOTP(
        type: OtpType.sms,
        token: otp,
        phone: phone,
      );
      final user = response.user;
      if (user == null) throw response;
      return UserModel.fromUser(user);
    } on AuthException catch (e) {
      throw AuthException(e.message);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await supabaseAuth.signOut();
    } on AuthException catch (e) {
      throw AuthException(e.message);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  UserModel currentUser() {
    try {
      final user = supabaseAuth.currentUser;
      if (user == null) throw AuthException("User not found");
      return UserModel.fromUser(user);
    } on AuthException catch (e) {
      throw AuthException(e.message);
    } catch (e) {
      throw ServerException();
    }
  }
}
