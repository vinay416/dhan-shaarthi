import 'package:flutter/material.dart';

import '../../../../core/string_const/string_const.dart';
import '../../../../theme/app_theme.dart';
import '../utils/auth_string_const.dart';

class WelcomeAuthTitle extends StatelessWidget {
  const WelcomeAuthTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AuthStringConst.kTitle,
          style: semiBoldTextStyle.copyWith(fontSize: 24),
        ),
        SizedBox(height: 8),
        RichText(
          text: TextSpan(
            text: AuthStringConst.kSubText,
            style: mediumTextStyle.copyWith(fontSize: 14),
            children: [
              TextSpan(
                text: " $kDhanSaarthi",
                style: mediumTextStyle.copyWith(
                  fontSize: 14,
                  color: kBlueColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
