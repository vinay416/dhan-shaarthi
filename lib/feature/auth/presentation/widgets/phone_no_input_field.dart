import 'dart:developer';

import 'package:dhan_saarthi/core/widgets/rect_button.dart';
import 'package:dhan_saarthi/feature/auth/domain/entities/phone_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../theme/app_theme.dart';
import '../bloc/auth_bloc.dart';

class PhoneNoInputField extends StatefulWidget {
  const PhoneNoInputField({super.key, required this.initialPhone});
  final PhoneNumber initialPhone;

  @override
  State<PhoneNoInputField> createState() => _PhoneNoInputFieldState();
}

class _PhoneNoInputFieldState extends State<PhoneNoInputField> {
  late TextEditingController controller;
  final FocusNode focusNode = FocusNode();
  bool validated = false;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initialPhone.number);
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildPhoneField(),
        SizedBox(height: 56),
        BlocSelector<AuthBloc, AuthState, bool>(
          selector: (state) {
            return (state is SendingOTP);
          },
          builder: (context, loading) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: RectButton(
                onTap: () {
                  final phoneNo = PhoneNumber(controller.text);
                  context.read<AuthBloc>().add(SendOTP(phoneNo));
                },
                title: "Proceed",
                isEnabled: validated,
                isLoading: loading,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget buildPhoneField() {
    return SizedBox(
      height: 45,
      child: TextFormField(
        style: semiBoldTextStyle.copyWith(fontSize: 14),
        focusNode: focusNode,
        cursorColor: kWhiteColor,
        onChanged: (value) {
          validated = value.trim().length == 10;
          log("Phone no : $validated");
          setState(() {});
        },
        onTapOutside: (event) => focusNode.unfocus(),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          fillColor: k262626Color,
          filled: true,
          border: border,
          errorBorder: border.copyWith(
            borderSide: border.borderSide.copyWith(color: kRedColor),
          ),
          enabledBorder: border,
          focusedBorder: border.copyWith(
            borderSide: border.borderSide.copyWith(color: kBlueColor),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("+91", style: semiBoldTextStyle.copyWith(fontSize: 14)),
              ],
            ),
          ),
          hintText: "9856671239",
          hintStyle: regularTextStyle.copyWith(
            // ignore: deprecated_member_use
            color: kWhiteColor.withOpacity(0.5),
          ),
          isCollapsed: true,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 12,
          ).copyWith(bottom: 10),
        ),
        keyboardType: TextInputType.number,
        maxLength: 10,
        controller: controller,
        buildCounter:
            (
              _, {
              required currentLength,
              required isFocused,
              required maxLength,
            }) => SizedBox.shrink(),
      ),
    );
  }

  OutlineInputBorder get border {
    return OutlineInputBorder(
      borderSide: BorderSide(color: k5D5D5DColor, width: 0.5),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
