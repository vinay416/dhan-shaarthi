import 'dart:async';

import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';

class OTPResend extends StatefulWidget {
  const OTPResend({super.key, required this.onTapResend});
  final VoidCallback onTapResend;

  @override
  State<OTPResend> createState() => _OTPResendState();
}

class _OTPResendState extends State<OTPResend> {
  Timer? timer;
  // ignore: non_constant_identifier_names
  final int MAX_TIMEOUT = 30;
  String remainTime = "";

  @override
  void initState() {
    remainTime = MAX_TIMEOUT.toString();
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timer.tick == MAX_TIMEOUT) {
        timer.cancel();
      }

      remainTime = (MAX_TIMEOUT - timer.tick).toString();
      setState(() {});
    });
  }

  bool get isTimerActive => timer?.isActive ?? false;

  @override
  Widget build(BuildContext context) {
    return Row(children: [buildTimerText(), buildResend()]);
  }

  Widget buildTimerText() {
    return isTimerActive
        ? Text("${remainTime}s", style: TextStyle(color: kWhiteColor))
        : Text(
          "Didn't Recieve OTP?",
          style: regularTextStyle.copyWith(color: kWhiteColor, fontSize: 12),
        );
  }

  Widget buildResend() {
    return TextButton(
      onPressed:
          isTimerActive
              ? null
              : () {
                widget.onTapResend();
                startTimer();
              },
      child: Text(
        "Resend",
        style: regularTextStyle.copyWith(
          color: isTimerActive ? k6D6D6DColor : kBlueColor,
          fontSize: 12,
        ),
      ),
    );
  }
}
