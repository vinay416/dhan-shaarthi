// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dhan_saarthi/core/widgets/terms_policy.dart';
import 'package:dhan_saarthi/feature/auth/domain/entities/phone_otp.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:dhan_saarthi/feature/auth/domain/entities/phone_number.dart';
import 'package:dhan_saarthi/feature/auth/presentation/widgets/otp_input_field.dart';

import '../utils/auth_string_const.dart';
import '../widgets/welcome_auth_title.dart';

class VerifyAuthArgs {
  final PhoneNumber phone;
  final PhoneOTP otp;
  const VerifyAuthArgs({required this.phone, required this.otp});
}

class VerifyAuthPage extends StatelessWidget {
  const VerifyAuthPage({super.key, required this.args});
  final VerifyAuthArgs args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(top: 36),
        child: SingleChildScrollView(child: buildTop()),
      ),
      bottomNavigationBar: buildBottom(),
    );
  }

  Widget buildTop() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WelcomeAuthTitle(),
        SizedBox(height: 82),
        Text(
          AuthStringConst.kEnterOtp,
          style: mediumTextStyle.copyWith(fontSize: 14),
        ),
        SizedBox(height: 52),
        OTPInputField(args: args),
        SizedBox(height: 18),
      ],
    );
  }

  Widget buildBottom() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(alignment: Alignment.center, child: TermsPolicy()),
        SizedBox(height: 18),
      ],
    );
  }
}
