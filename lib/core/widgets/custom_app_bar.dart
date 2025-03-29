import 'package:dhan_saarthi/core/context.extension.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../string_const/icon_string.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.actions = const [], this.title = ""});
  final List<Widget> actions;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: context.pop,
        icon: SizedBox.square(
          dimension: 24,
          child: Image.asset(kBackArrowIcon),
        ),
      ),

      titleSpacing: -5,
      title: Text("", style: semiBoldTextStyle.copyWith(fontSize: 20)),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(54);
}
