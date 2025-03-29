import 'dart:async';
import 'dart:developer';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/core/toast_helper..dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/phone_number.dart';
import '../../domain/entities/phone_otp.dart';
import '../../domain/usecase/current_user_auth.dart';
import '../../domain/usecase/send_otp_auth.dart';
import '../../domain/usecase/sign_out_auth.dart';
import '../../domain/usecase/verify_otp_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SendOtpAuth sendOtpAuth;
  final VerifyOtpAuth verifyOtpAuth;
  final SignOutAuth signOutAuth;
  final CurrentUserAuth currentUserAuth;
  final ToastHelper toastHelper;

  AuthBloc({
    required this.sendOtpAuth,
    required this.verifyOtpAuth,
    required this.signOutAuth,
    required this.currentUserAuth,
    required this.toastHelper,
  }) : super(
         UnAuthenticated(PhoneNumber("")),
         //  currentUserAuth.user
         //      ? Authenticated()
         //      : UnAuthenticated(PhoneNumber("")),
       ) {
    on<InitialAuth>(_onInitialAuth);
    on<SendOTP>(_onSendOTP);
    on<VerifyOTP>(_onVerifyOTP);
    on<ResendOTP>(_onResendOTP);
    on<SignOutEvent>(_onSignOut);
  }

  FutureOr<void> _onInitialAuth(event, emit) {
    if (currentUserAuth.user) emit(Authenticated());
  }

  FutureOr<void> _onSendOTP(SendOTP event, Emitter<AuthState> emit) async {
    emit(SendingOTP());
    final response = await sendOtpAuth.call(event.phoneNumber);
    final state = response.fold(
      (failure) {
        _failureMsg(failure);
        return UnAuthenticated(event.phoneNumber);
      },
      (success) {
        return VerifyAuth(phone: event.phoneNumber, otp: PhoneOTP(otp: ""));
      },
    );
    emit(state);
  }

  FutureOr<void> _onVerifyOTP(VerifyOTP event, Emitter<AuthState> emit) async {
    emit(VerifyingAuth());
    final response = await verifyOtpAuth.call(event.phoneOTP, event.phone);
    final state = response.fold((failure) {
      return VerifyingAuthFailed();
    }, (userEntity) => Authenticated());
    emit(state);
  }

  FutureOr<void> _onResendOTP(ResendOTP event, Emitter<AuthState> emit) async {
    emit(ResendVerifyAuth());
    final response = await sendOtpAuth.call(event.phone);
    response.fold(_failureMsg, (_) => toastHelper.show("OTP Resent"));
  }

  FutureOr<void> _onSignOut(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(SigningOut(loading: true));
    final response = await signOutAuth.call();
    final state = response.fold((failure) {
      _failureMsg(failure);
      return SigningOut(loading: false);
    }, (unit) => SignedOut());
    emit(state);
  }

  void _failureMsg(Failure failure) {
    log("Auth failure ; ${failure.msg}");
    final msg = switch (failure) {
      ServerFailure() => "Server issue",
      CacheFailure() => "Cache issue",
      ParsingFailure() => "Something went wrong",
      SendOTPFailure() => "Invalid login details",
      VerifyOTPFailure() => "Invalid OTP",
      AuthFailure() => "Something went wrong",
    };

    toastHelper.show(msg);
  }
}
