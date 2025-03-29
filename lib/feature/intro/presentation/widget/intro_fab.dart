import 'dart:math' as math;

import 'package:dhan_saarthi/core/context.extension.dart';
import 'package:dhan_saarthi/core/string_const/icon_string.dart';
import 'package:dhan_saarthi/feature/auth/domain/entities/phone_number.dart';
import 'package:dhan_saarthi/feature/intro/presentation/bloc/intro_bloc.dart';
import 'package:dhan_saarthi/routes/routes.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IntroFAB extends StatelessWidget {
  const IntroFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<IntroBloc, IntroState>(
      listener: (context, state) {
        if (state is Login) {
          context.pushAndReplace(
            Routes.unAuthenticated,
            arguments: PhoneNumber(""),
          );
        }
      },
      child: FloatingActionButton(
        onPressed: () {
          context.read<IntroBloc>().add(LoginEvent());
        },
        shape: CircleBorder(),
        backgroundColor: kBlueColor,
        child: Transform.rotate(
          angle: math.pi,
          child: Image.asset(kBackArrowIcon, color: kWhiteColor, width: 30),
        ),
      ),
    );
  }
}
