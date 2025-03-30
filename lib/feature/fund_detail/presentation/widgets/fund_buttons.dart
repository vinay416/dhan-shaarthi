import 'package:dhan_saarthi/core/string_const/icon_string.dart';
import 'package:dhan_saarthi/core/widgets/rect_button.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';

class FundButtons extends StatelessWidget {
  const FundButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      height: 73,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 26),
      child: Row(
        children: [
          buildButton("Sell", kArrowDownIcon),
          SizedBox(width: 24),
          buildButton("Invest More", kArrowUpIcon),
        ],
      ),
    );
  }

  Widget buildButton(String title, String icon) {
    return Expanded(
      child: SizedBox(
        height: 41,
        child: RectButton(
          onTap: () {},
          isEnabled: true,
          title: title,
          icon: Padding(
            padding: const EdgeInsets.only(left: 6, bottom: 2),
            child: SizedBox.square(dimension: 15, child: Image.asset(icon)),
          ),
          textStyle: semiBoldTextStyle.copyWith(fontSize: 14),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
