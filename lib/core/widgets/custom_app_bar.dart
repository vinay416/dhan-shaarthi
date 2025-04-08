import 'package:dhan_saarthi/core/context.extension.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../string_const/icon_string.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.actions = const [],
    this.title = "",
    this.leading = true,
    this.textStyle,
  });
  final List<Widget> actions;
  final String title;
  final bool leading;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      leading:
          leading
              ? IconButton(
                onPressed: context.pop,
                icon: SizedBox.square(
                  dimension: 24,
                  child: Image.asset(kBackArrowIcon),
                ),
              )
              : SizedBox.shrink(),
      titleSpacing: -5,
      leadingWidth: leading ? null : 30,
      title: Text(
        title,
        style: textStyle ?? semiBoldTextStyle.copyWith(fontSize: 20),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(54);
}
