import 'package:dhan_saarthi/core/context.extension.dart';
import 'package:dhan_saarthi/feature/auth/domain/entities/phone_number.dart';
import 'package:dhan_saarthi/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:dhan_saarthi/feature/auth/presentation/pages/verify_auth_page.dart';
import 'package:dhan_saarthi/main.dart';
import 'package:dhan_saarthi/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthWatcher extends StatelessWidget {
  const AuthWatcher({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is VerifyAuth) {
          navigatorKey.currentContext?.pushAndReplace(
            Routes.verifyOTP,
            arguments: VerifyAuthArgs(phone: state.phone, otp: state.otp),
          );
        } else if (state is Authenticated) {
          navigatorKey.currentContext?.pushAndClearStack(Routes.authenticated);
        } else if (state is SignedOut) {
          navigatorKey.currentContext?.pushAndClearStack(
            Routes.unAuthenticated,
            arguments: PhoneNumber(""),
          );
        }
      },
      child: child,
    );
  }
}
