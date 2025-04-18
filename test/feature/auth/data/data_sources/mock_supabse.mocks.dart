// Mocks generated by Mockito 5.4.5 from annotations
// in dhan_saarthi/test/feature/auth/data/data_sources/mock_supabse.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i5;
import 'package:supabase_flutter/supabase_flutter.dart' as _i2;

import 'mock_supabse.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeGoTrueAdminApi_0 extends _i1.SmartFake
    implements _i2.GoTrueAdminApi {
  _FakeGoTrueAdminApi_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeGoTrueMFAApi_1 extends _i1.SmartFake implements _i2.GoTrueMFAApi {
  _FakeGoTrueMFAApi_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeAuthResponse_2 extends _i1.SmartFake implements _i2.AuthResponse {
  _FakeAuthResponse_2(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeOAuthResponse_3 extends _i1.SmartFake implements _i2.OAuthResponse {
  _FakeOAuthResponse_3(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeAuthSessionUrlResponse_4 extends _i1.SmartFake
    implements _i2.AuthSessionUrlResponse {
  _FakeAuthSessionUrlResponse_4(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeResendResponse_5 extends _i1.SmartFake
    implements _i2.ResendResponse {
  _FakeResendResponse_5(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeUserResponse_6 extends _i1.SmartFake implements _i2.UserResponse {
  _FakeUserResponse_6(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeObject_7 extends _i1.SmartFake implements Object {
  _FakeObject_7(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [MySupabase].
///
/// See the documentation for Mockito's code generation for more information.
class MockMySupabase extends _i1.Mock implements _i3.MySupabase {
  MockMySupabase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GoTrueAdminApi get admin =>
      (super.noSuchMethod(
            Invocation.getter(#admin),
            returnValue: _FakeGoTrueAdminApi_0(this, Invocation.getter(#admin)),
          )
          as _i2.GoTrueAdminApi);

  @override
  set admin(_i2.GoTrueAdminApi? _admin) => super.noSuchMethod(
    Invocation.setter(#admin, _admin),
    returnValueForMissingStub: null,
  );

  @override
  _i2.GoTrueMFAApi get mfa =>
      (super.noSuchMethod(
            Invocation.getter(#mfa),
            returnValue: _FakeGoTrueMFAApi_1(this, Invocation.getter(#mfa)),
          )
          as _i2.GoTrueMFAApi);

  @override
  set mfa(_i2.GoTrueMFAApi? _mfa) => super.noSuchMethod(
    Invocation.setter(#mfa, _mfa),
    returnValueForMissingStub: null,
  );

  @override
  _i4.Stream<_i2.AuthState> get onAuthStateChange =>
      (super.noSuchMethod(
            Invocation.getter(#onAuthStateChange),
            returnValue: _i4.Stream<_i2.AuthState>.empty(),
          )
          as _i4.Stream<_i2.AuthState>);

  @override
  _i4.Stream<_i2.AuthState> get onAuthStateChangeSync =>
      (super.noSuchMethod(
            Invocation.getter(#onAuthStateChangeSync),
            returnValue: _i4.Stream<_i2.AuthState>.empty(),
          )
          as _i4.Stream<_i2.AuthState>);

  @override
  Map<String, String> get headers =>
      (super.noSuchMethod(
            Invocation.getter(#headers),
            returnValue: <String, String>{},
          )
          as Map<String, String>);

  @override
  _i4.Future<_i2.AuthResponse> signInAnonymously({
    Map<String, dynamic>? data,
    String? captchaToken,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#signInAnonymously, [], {
              #data: data,
              #captchaToken: captchaToken,
            }),
            returnValue: _i4.Future<_i2.AuthResponse>.value(
              _FakeAuthResponse_2(
                this,
                Invocation.method(#signInAnonymously, [], {
                  #data: data,
                  #captchaToken: captchaToken,
                }),
              ),
            ),
          )
          as _i4.Future<_i2.AuthResponse>);

  @override
  _i4.Future<_i2.AuthResponse> signUp({
    String? email,
    String? phone,
    required String? password,
    String? emailRedirectTo,
    Map<String, dynamic>? data,
    String? captchaToken,
    _i2.OtpChannel? channel = _i2.OtpChannel.sms,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#signUp, [], {
              #email: email,
              #phone: phone,
              #password: password,
              #emailRedirectTo: emailRedirectTo,
              #data: data,
              #captchaToken: captchaToken,
              #channel: channel,
            }),
            returnValue: _i4.Future<_i2.AuthResponse>.value(
              _FakeAuthResponse_2(
                this,
                Invocation.method(#signUp, [], {
                  #email: email,
                  #phone: phone,
                  #password: password,
                  #emailRedirectTo: emailRedirectTo,
                  #data: data,
                  #captchaToken: captchaToken,
                  #channel: channel,
                }),
              ),
            ),
          )
          as _i4.Future<_i2.AuthResponse>);

  @override
  _i4.Future<_i2.AuthResponse> signInWithPassword({
    String? email,
    String? phone,
    required String? password,
    String? captchaToken,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#signInWithPassword, [], {
              #email: email,
              #phone: phone,
              #password: password,
              #captchaToken: captchaToken,
            }),
            returnValue: _i4.Future<_i2.AuthResponse>.value(
              _FakeAuthResponse_2(
                this,
                Invocation.method(#signInWithPassword, [], {
                  #email: email,
                  #phone: phone,
                  #password: password,
                  #captchaToken: captchaToken,
                }),
              ),
            ),
          )
          as _i4.Future<_i2.AuthResponse>);

  @override
  _i4.Future<_i2.OAuthResponse> getOAuthSignInUrl({
    required _i2.OAuthProvider? provider,
    String? redirectTo,
    String? scopes,
    Map<String, String>? queryParams,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#getOAuthSignInUrl, [], {
              #provider: provider,
              #redirectTo: redirectTo,
              #scopes: scopes,
              #queryParams: queryParams,
            }),
            returnValue: _i4.Future<_i2.OAuthResponse>.value(
              _FakeOAuthResponse_3(
                this,
                Invocation.method(#getOAuthSignInUrl, [], {
                  #provider: provider,
                  #redirectTo: redirectTo,
                  #scopes: scopes,
                  #queryParams: queryParams,
                }),
              ),
            ),
          )
          as _i4.Future<_i2.OAuthResponse>);

  @override
  _i4.Future<_i2.AuthSessionUrlResponse> exchangeCodeForSession(
    String? authCode,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#exchangeCodeForSession, [authCode]),
            returnValue: _i4.Future<_i2.AuthSessionUrlResponse>.value(
              _FakeAuthSessionUrlResponse_4(
                this,
                Invocation.method(#exchangeCodeForSession, [authCode]),
              ),
            ),
          )
          as _i4.Future<_i2.AuthSessionUrlResponse>);

  @override
  _i4.Future<_i2.AuthResponse> signInWithIdToken({
    required _i2.OAuthProvider? provider,
    required String? idToken,
    String? accessToken,
    String? nonce,
    String? captchaToken,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#signInWithIdToken, [], {
              #provider: provider,
              #idToken: idToken,
              #accessToken: accessToken,
              #nonce: nonce,
              #captchaToken: captchaToken,
            }),
            returnValue: _i4.Future<_i2.AuthResponse>.value(
              _FakeAuthResponse_2(
                this,
                Invocation.method(#signInWithIdToken, [], {
                  #provider: provider,
                  #idToken: idToken,
                  #accessToken: accessToken,
                  #nonce: nonce,
                  #captchaToken: captchaToken,
                }),
              ),
            ),
          )
          as _i4.Future<_i2.AuthResponse>);

  @override
  _i4.Future<void> signInWithOtp({
    String? email,
    String? phone,
    String? emailRedirectTo,
    bool? shouldCreateUser,
    Map<String, dynamic>? data,
    String? captchaToken,
    _i2.OtpChannel? channel = _i2.OtpChannel.sms,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#signInWithOtp, [], {
              #email: email,
              #phone: phone,
              #emailRedirectTo: emailRedirectTo,
              #shouldCreateUser: shouldCreateUser,
              #data: data,
              #captchaToken: captchaToken,
              #channel: channel,
            }),
            returnValue: _i4.Future<void>.value(),
            returnValueForMissingStub: _i4.Future<void>.value(),
          )
          as _i4.Future<void>);

  @override
  _i4.Future<_i2.AuthResponse> verifyOTP({
    String? email,
    String? phone,
    String? token,
    required _i2.OtpType? type,
    String? redirectTo,
    String? captchaToken,
    String? tokenHash,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#verifyOTP, [], {
              #email: email,
              #phone: phone,
              #token: token,
              #type: type,
              #redirectTo: redirectTo,
              #captchaToken: captchaToken,
              #tokenHash: tokenHash,
            }),
            returnValue: _i4.Future<_i2.AuthResponse>.value(
              _FakeAuthResponse_2(
                this,
                Invocation.method(#verifyOTP, [], {
                  #email: email,
                  #phone: phone,
                  #token: token,
                  #type: type,
                  #redirectTo: redirectTo,
                  #captchaToken: captchaToken,
                  #tokenHash: tokenHash,
                }),
              ),
            ),
          )
          as _i4.Future<_i2.AuthResponse>);

  @override
  _i4.Future<String> getSSOSignInUrl({
    String? providerId,
    String? domain,
    String? redirectTo,
    String? captchaToken,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#getSSOSignInUrl, [], {
              #providerId: providerId,
              #domain: domain,
              #redirectTo: redirectTo,
              #captchaToken: captchaToken,
            }),
            returnValue: _i4.Future<String>.value(
              _i5.dummyValue<String>(
                this,
                Invocation.method(#getSSOSignInUrl, [], {
                  #providerId: providerId,
                  #domain: domain,
                  #redirectTo: redirectTo,
                  #captchaToken: captchaToken,
                }),
              ),
            ),
          )
          as _i4.Future<String>);

  @override
  _i4.Future<_i2.AuthResponse> refreshSession([String? refreshToken]) =>
      (super.noSuchMethod(
            Invocation.method(#refreshSession, [refreshToken]),
            returnValue: _i4.Future<_i2.AuthResponse>.value(
              _FakeAuthResponse_2(
                this,
                Invocation.method(#refreshSession, [refreshToken]),
              ),
            ),
          )
          as _i4.Future<_i2.AuthResponse>);

  @override
  _i4.Future<void> reauthenticate() =>
      (super.noSuchMethod(
            Invocation.method(#reauthenticate, []),
            returnValue: _i4.Future<void>.value(),
            returnValueForMissingStub: _i4.Future<void>.value(),
          )
          as _i4.Future<void>);

  @override
  _i4.Future<_i2.ResendResponse> resend({
    String? email,
    String? phone,
    required _i2.OtpType? type,
    String? emailRedirectTo,
    String? captchaToken,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#resend, [], {
              #email: email,
              #phone: phone,
              #type: type,
              #emailRedirectTo: emailRedirectTo,
              #captchaToken: captchaToken,
            }),
            returnValue: _i4.Future<_i2.ResendResponse>.value(
              _FakeResendResponse_5(
                this,
                Invocation.method(#resend, [], {
                  #email: email,
                  #phone: phone,
                  #type: type,
                  #emailRedirectTo: emailRedirectTo,
                  #captchaToken: captchaToken,
                }),
              ),
            ),
          )
          as _i4.Future<_i2.ResendResponse>);

  @override
  _i4.Future<_i2.UserResponse> getUser([String? jwt]) =>
      (super.noSuchMethod(
            Invocation.method(#getUser, [jwt]),
            returnValue: _i4.Future<_i2.UserResponse>.value(
              _FakeUserResponse_6(this, Invocation.method(#getUser, [jwt])),
            ),
          )
          as _i4.Future<_i2.UserResponse>);

  @override
  _i4.Future<_i2.UserResponse> updateUser(
    _i2.UserAttributes? attributes, {
    String? emailRedirectTo,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #updateUser,
              [attributes],
              {#emailRedirectTo: emailRedirectTo},
            ),
            returnValue: _i4.Future<_i2.UserResponse>.value(
              _FakeUserResponse_6(
                this,
                Invocation.method(
                  #updateUser,
                  [attributes],
                  {#emailRedirectTo: emailRedirectTo},
                ),
              ),
            ),
          )
          as _i4.Future<_i2.UserResponse>);

  @override
  _i4.Future<_i2.AuthResponse> setSession(String? refreshToken) =>
      (super.noSuchMethod(
            Invocation.method(#setSession, [refreshToken]),
            returnValue: _i4.Future<_i2.AuthResponse>.value(
              _FakeAuthResponse_2(
                this,
                Invocation.method(#setSession, [refreshToken]),
              ),
            ),
          )
          as _i4.Future<_i2.AuthResponse>);

  @override
  _i4.Future<_i2.AuthSessionUrlResponse> getSessionFromUrl(
    Uri? originUrl, {
    bool? storeSession = true,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #getSessionFromUrl,
              [originUrl],
              {#storeSession: storeSession},
            ),
            returnValue: _i4.Future<_i2.AuthSessionUrlResponse>.value(
              _FakeAuthSessionUrlResponse_4(
                this,
                Invocation.method(
                  #getSessionFromUrl,
                  [originUrl],
                  {#storeSession: storeSession},
                ),
              ),
            ),
          )
          as _i4.Future<_i2.AuthSessionUrlResponse>);

  @override
  _i4.Future<void> signOut({
    _i2.SignOutScope? scope = _i2.SignOutScope.local,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#signOut, [], {#scope: scope}),
            returnValue: _i4.Future<void>.value(),
            returnValueForMissingStub: _i4.Future<void>.value(),
          )
          as _i4.Future<void>);

  @override
  _i4.Future<void> resetPasswordForEmail(
    String? email, {
    String? redirectTo,
    String? captchaToken,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #resetPasswordForEmail,
              [email],
              {#redirectTo: redirectTo, #captchaToken: captchaToken},
            ),
            returnValue: _i4.Future<void>.value(),
            returnValueForMissingStub: _i4.Future<void>.value(),
          )
          as _i4.Future<void>);

  @override
  _i4.Future<List<_i2.UserIdentity>> getUserIdentities() =>
      (super.noSuchMethod(
            Invocation.method(#getUserIdentities, []),
            returnValue: _i4.Future<List<_i2.UserIdentity>>.value(
              <_i2.UserIdentity>[],
            ),
          )
          as _i4.Future<List<_i2.UserIdentity>>);

  @override
  _i4.Future<_i2.OAuthResponse> getLinkIdentityUrl(
    _i2.OAuthProvider? provider, {
    String? redirectTo,
    String? scopes,
    Map<String, String>? queryParams,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #getLinkIdentityUrl,
              [provider],
              {
                #redirectTo: redirectTo,
                #scopes: scopes,
                #queryParams: queryParams,
              },
            ),
            returnValue: _i4.Future<_i2.OAuthResponse>.value(
              _FakeOAuthResponse_3(
                this,
                Invocation.method(
                  #getLinkIdentityUrl,
                  [provider],
                  {
                    #redirectTo: redirectTo,
                    #scopes: scopes,
                    #queryParams: queryParams,
                  },
                ),
              ),
            ),
          )
          as _i4.Future<_i2.OAuthResponse>);

  @override
  _i4.Future<void> unlinkIdentity(_i2.UserIdentity? identity) =>
      (super.noSuchMethod(
            Invocation.method(#unlinkIdentity, [identity]),
            returnValue: _i4.Future<void>.value(),
            returnValueForMissingStub: _i4.Future<void>.value(),
          )
          as _i4.Future<void>);

  @override
  _i4.Future<void> setInitialSession(String? jsonStr) =>
      (super.noSuchMethod(
            Invocation.method(#setInitialSession, [jsonStr]),
            returnValue: _i4.Future<void>.value(),
            returnValueForMissingStub: _i4.Future<void>.value(),
          )
          as _i4.Future<void>);

  @override
  _i4.Future<_i2.AuthResponse> recoverSession(String? jsonStr) =>
      (super.noSuchMethod(
            Invocation.method(#recoverSession, [jsonStr]),
            returnValue: _i4.Future<_i2.AuthResponse>.value(
              _FakeAuthResponse_2(
                this,
                Invocation.method(#recoverSession, [jsonStr]),
              ),
            ),
          )
          as _i4.Future<_i2.AuthResponse>);

  @override
  void startAutoRefresh() => super.noSuchMethod(
    Invocation.method(#startAutoRefresh, []),
    returnValueForMissingStub: null,
  );

  @override
  void stopAutoRefresh() => super.noSuchMethod(
    Invocation.method(#stopAutoRefresh, []),
    returnValueForMissingStub: null,
  );

  @override
  void dispose() => super.noSuchMethod(
    Invocation.method(#dispose, []),
    returnValueForMissingStub: null,
  );

  @override
  void notifyAllSubscribers(
    _i2.AuthChangeEvent? event, {
    _i2.Session? session,
    bool? broadcast = true,
  }) => super.noSuchMethod(
    Invocation.method(
      #notifyAllSubscribers,
      [event],
      {#session: session, #broadcast: broadcast},
    ),
    returnValueForMissingStub: null,
  );

  @override
  Object notifyException(Object? exception, [StackTrace? stackTrace]) =>
      (super.noSuchMethod(
            Invocation.method(#notifyException, [exception, stackTrace]),
            returnValue: _FakeObject_7(
              this,
              Invocation.method(#notifyException, [exception, stackTrace]),
            ),
          )
          as Object);
}
