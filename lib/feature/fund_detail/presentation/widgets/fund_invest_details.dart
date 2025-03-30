import 'package:dhan_saarthi/core/string_const/icon_string.dart';
import 'package:dhan_saarthi/core/string_const/string_const.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';

class FundInvestDetails extends StatelessWidget {
  const FundInvestDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        border: Border.all(color: k3D3D3DColor, width: 1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildValues("Invested", "1.5K"),
          buildBar(),
          buildValues("Current Value", "1.28K"),
          buildBar(),
          buildGain("-220.16", "14.5"),
        ],
      ),
    );
  }

  Container buildBar() {
    return Container(height: 32, width: 0.5, color: k888888Color);
  }

  Column buildValues(String title, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: regularTextStyle.copyWith(fontSize: 12, color: k6D6D6DColor),
        ),
        SizedBox(height: 4),
        Text(
          "$kRupee$value",
          style: semiBoldTextStyle.copyWith(fontSize: 14, color: kE7E7E7Color),
        ),
      ],
    );
  }

  Column buildGain(String gain, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Total Gain",
          style: regularTextStyle.copyWith(fontSize: 12, color: k6D6D6DColor),
        ),
        SizedBox(height: 4),
        Row(
          children: [
            Text(
              "$kRupee$gain  ",
              style: semiBoldTextStyle.copyWith(
                fontSize: 14,
                color: kE7E7E7Color,
              ),
            ),
            RichText(
              text: TextSpan(
                text: "",
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: SizedBox.square(
                        dimension: 9,
                        child: Image.asset(kCaretDownIcon),
                      ),
                    ),
                  ),
                  TextSpan(
                    text: value,
                    style: mediumTextStyle.copyWith(
                      fontSize: 14,
                      color: kRedColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
