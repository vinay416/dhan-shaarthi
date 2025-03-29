import 'package:dhan_saarthi/feature/auth/domain/entities/phone_otp.dart';
import 'package:dhan_saarthi/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:dhan_saarthi/feature/auth/presentation/widgets/otp_resend.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/widgets/rect_button.dart';
import '../pages/verify_auth_page.dart';
import 'phone_no_formatted.dart';

class OTPInputField extends StatefulWidget {
  const OTPInputField({required this.args, super.key});
  final VerifyAuthArgs args;

  @override
  State<OTPInputField> createState() => _OTPInputFieldState();
}

class _OTPInputFieldState extends State<OTPInputField> {
  // late final SmsRetriever smsRetriever;
  late TextEditingController controller;
  final formKey = GlobalKey<FormState>();
  late final FocusNode focusNode;
  bool error = false;
  bool isValid = false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.args.otp.otp);
    focusNode = FocusNode();

    /// In case you need an SMS autofill feature
    // smsRetriever = SmsRetrieverImpl(SmartAuth());
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        error = (state is VerifyingAuthFailed);
        if (error) formKey.currentState?.validate();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildOtpInput(),
          SizedBox(height: 34),
          buildOTPResend(context),
          PhoneNoFormatted(phone: widget.args.phone),
          SizedBox(height: 56),
          Align(alignment: Alignment.center, child: buildButton()),
        ],
      ),
    );
  }

  OTPResend buildOTPResend(BuildContext context) {
    return OTPResend(
      onTapResend: () {
        controller.clear();
        error = false;
        formKey.currentState?.validate();
        context.read<AuthBloc>().add(ResendOTP(widget.args.phone));
      },
    );
  }

  BlocSelector<AuthBloc, AuthState, bool> buildButton() {
    return BlocSelector<AuthBloc, AuthState, bool>(
      selector: (state) {
        return (state is VerifyingAuth);
      },
      builder: (context, loading) {
        return RectButton(
          onTap: () {
            final otp = PhoneOTP(otp: controller.text);
            context.read<AuthBloc>().add(VerifyOTP(otp, widget.args.phone));
          },
          title: "Proceed",
          isEnabled: isValid,
          isLoading: loading,
        );
      },
    );
  }

  Form buildOtpInput() {
    final defaultPinTheme = PinTheme(
      width: 25,
      height: 40,
      textStyle: regularTextStyle.copyWith(fontSize: 24.43, color: kWhiteColor),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: k6D6D6DColor, width: 3)),
      ),
    );

    final cursor = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 25,
          height: 3,
          decoration: BoxDecoration(
            color: kBlueColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
    return Form(
      key: formKey,
      child: Center(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Pinput(
                // smsRetriever: smsRetriever,
                closeKeyboardWhenCompleted: true,

                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                length: 6,
                controller: controller,
                pinAnimationType: PinAnimationType.slide,
                focusNode: focusNode,
                defaultPinTheme: defaultPinTheme,
                separatorBuilder: (index) {
                  return SizedBox(width: (constraints.maxWidth - (20 * 6)) / 6);
                },
                validator: (value) {
                  if (error) {
                    return "Invalid OTP, please try again";
                  }
                  return null;
                },
                onSubmitted: (value) {
                  error = value.isNotEmpty;
                  formKey.currentState?.validate();
                },
                errorTextStyle: TextStyle(color: kRedColor, fontSize: 18),
                errorBuilder: (errorText, pin) {
                  return Transform.translate(
                    offset: Offset(-5, 34),
                    child: Text(
                      errorText ?? "",
                      style: regularTextStyle.copyWith(
                        color: Color(0xFFEC817D),
                        fontSize: 12,
                      ),
                    ),
                  );
                },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) => debugPrint('onCompleted: $pin'),
                onChanged: (value) {
                  isValid = value.length == 6;
                  error = !isValid;
                  setState(() {});
                  debugPrint('onChanged: $value');
                },
                cursor: cursor,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border(
                      bottom: BorderSide(color: kBlueColor, width: 0),
                    ),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border(
                      bottom: BorderSide(color: kBlueColor, width: 3),
                    ),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFEC817D), width: 3),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// class SmsRetrieverImpl implements SmsRetriever {
//   const SmsRetrieverImpl(this.smartAuth);

//   final SmartAuth smartAuth;

//   @override
//   Future<void> dispose() {
//     return smartAuth.removeSmsRetrieverApiListener();
//   }

//   @override
//   Future<String?> getSmsCode() async {
//     final signature = await smartAuth.getAppSignature();
//     debugPrint('App Signature: $signature');
//     final res = await smartAuth.getSmsCode(useUserConsentApi: true);
//     if (res.succeed && res.codeFound) {
//       return res.code!;
//     }
//     return null;
//   }

//   @override
//   bool get listenForMultipleSms => false;
// }
