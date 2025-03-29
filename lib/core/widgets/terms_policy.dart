import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TermsPolicy extends StatelessWidget {
  const TermsPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "By signing in, you agree to our",
        style: mediumTextStyle.copyWith(fontSize: 10),
        children: [
          TextSpan(
            text: " T&C",
            style: mediumTextStyle.copyWith(fontSize: 10, color: kBlueColor),
          ),
          TextSpan(text: " and", style: mediumTextStyle.copyWith(fontSize: 10)),
          TextSpan(
            text: " Privacy Policy",
            style: mediumTextStyle.copyWith(fontSize: 10, color: kBlueColor),
          ),
        ],
      ),
    );
  }
}
