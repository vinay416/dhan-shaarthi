import 'package:dhan_saarthi/core/widgets/terms_policy.dart';
import 'package:dhan_saarthi/feature/auth/domain/entities/phone_number.dart';
import 'package:dhan_saarthi/feature/auth/presentation/utils/auth_string_const.dart';
import 'package:dhan_saarthi/feature/auth/presentation/widgets/phone_no_input_field.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../widgets/welcome_auth_title.dart';

class UnauthenticatedPage extends StatelessWidget {
  const UnauthenticatedPage({super.key, required this.phone});
  final PhoneNumber phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: buildTop(),
      ),
      bottomNavigationBar: buildBottom(),
    );
  }

  Widget buildTop() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 36),
          WelcomeAuthTitle(),
          SizedBox(height: 82),
          Text(
            AuthStringConst.kEnterNumber,
            style: mediumTextStyle.copyWith(fontSize: 14),
          ),
          SizedBox(height: 12),
          PhoneNoInputField(initialPhone: phone),
        ],
      ),
    );
  }

  Widget buildBottom() {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(alignment: Alignment.center, child: TermsPolicy()),
          SizedBox(height: 18),
        ],
      ),
    );
  }
}
