import 'package:dhan_saarthi/core/string_const/icon_string.dart';
import 'package:dhan_saarthi/core/string_const/string_const.dart';
import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';

class FundTopDetails extends StatelessWidget {
  const FundTopDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 200),
          child: Text(
            "Motilal Oswal Midcap Direct Growth",
            style: semiBoldTextStyle.copyWith(fontSize: 18),
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            RichText(
              text: TextSpan(
                text: "Nav ",
                style: mediumTextStyle.copyWith(fontSize: 10),
                children: [
                  TextSpan(
                    text: "$kRupee 104.2",
                    style: mediumTextStyle.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.0),
            Container(height: 17, width: 1, color: k888888Color),
            SizedBox(width: 12.0),
            RichText(
              text: TextSpan(
                text: "1D ",
                style: mediumTextStyle.copyWith(fontSize: 10),
                children: [
                  TextSpan(
                    text: "$kRupee -10",
                    style: mediumTextStyle.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.0),
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
                    text: "-3.7",
                    style: mediumTextStyle.copyWith(fontSize: 12),
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
