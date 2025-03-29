
import 'package:dhan_saarthi/core/string_const/icon_string.dart';
import 'package:dhan_saarthi/feature/auth/domain/entities/phone_number.dart';
import 'package:dhan_saarthi/feature/auth/presentation/pages/unauthenticated_page.dart';
import 'package:dhan_saarthi/feature/intro/presentation/bloc/intro_bloc.dart';
import 'package:dhan_saarthi/feature/intro/presentation/widget/intro_fab.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/intro_string_const.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntroBloc, IntroState>(
      builder: (context, state) {
        if (state is Login) {
          return UnauthenticatedPage(phone: PhoneNumber(""));
        }

        return Scaffold(
          appBar: AppBar(toolbarHeight: 0),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox.shrink(),
              Column(
                children: [
                  Image.asset(kLogoIcon, height: 130),
                  SizedBox(height: 46),
                  Text(
                    IntroStringConst.kTitle,
                    style: semiBoldTextStyle.copyWith(fontSize: 32),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 27.25,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      IntroStringConst.kSubText,
                      style: regularTextStyle.copyWith(
                        fontSize: 14,
                        color: k888888Color,
                      ),
                    ),
                    IntroFAB(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
