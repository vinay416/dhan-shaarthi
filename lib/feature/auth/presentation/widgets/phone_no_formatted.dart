import 'package:dhan_saarthi/core/context.extension.dart';
import 'package:dhan_saarthi/feature/auth/domain/entities/phone_number.dart';
import 'package:dhan_saarthi/routes/routes.dart';
import 'package:flutter/material.dart';

import '../../../../core/string_const/icon_string.dart';
import '../../../../theme/app_theme.dart';
import '../utils/auth_string_const.dart';

class PhoneNoFormatted extends StatelessWidget {
  const PhoneNoFormatted({super.key, required this.phone});
  final PhoneNumber phone;

  @override
  Widget build(BuildContext context) {
    final no = phone.number;
    final start = no.substring(0, 3);
    final end = no.substring(7);
    return InkWell(
      onTap: () {
        context.pushAndReplace(Routes.unAuthenticated, arguments: phone);
      },
      child: RichText(
        text: TextSpan(
          text: "${AuthStringConst.kOTPSentTo} ",
          style: regularTextStyle.copyWith(fontSize: 12, color: k888888Color),
          children: [
            TextSpan(text: start),
            TextSpan(text: "****"),
            TextSpan(text: "$end "),
            WidgetSpan(child: Image.asset(kPencilIcon, width: 12, height: 12)),
          ],
        ),
      ),
    );
  }
}
