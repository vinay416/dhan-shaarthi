import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'loader.dart';

class RectButton extends StatelessWidget {
  const RectButton({
    super.key,
    required this.onTap,
    required this.title,
    this.backgroundColor = kBlueColor,
    this.isEnabled = false,
    this.isLoading = false,
    this.icon,
    this.textStyle,
    this.borderRadius,
  });
  final bool isEnabled;
  final bool isLoading;
  final VoidCallback onTap;
  final String title;
  final Color backgroundColor;
  final Widget? icon;
  final TextStyle? textStyle;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isEnabled ? onTap : null,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          isEnabled ? backgroundColor : k262626Color,
        ),
        side: WidgetStatePropertyAll(
          BorderSide(
            color: isEnabled ? backgroundColor : k5D5D5DColor,
            width: 0.75,
          ),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10),
          ),
        ),
      ),
      child:
          isLoading
              ? Loader()
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style:
                        textStyle ?? semiBoldTextStyle.copyWith(fontSize: 14),
                  ),
                  icon ?? SizedBox.shrink(),
                ],
              ),
    );
  }
}
