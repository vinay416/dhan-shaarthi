import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../../../core/string_const/icon_string.dart';

class WatchlistEmptyPage extends StatelessWidget {
  const WatchlistEmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 50,
        children: [
          Image.asset(kGraphSearchIcon),
          Text(
            "No Watchlist added!\nTap on 'edit' to create/edit watchlist.",
            textAlign: TextAlign.center,
            style: mediumTextStyle.copyWith(color: kB0B0B0Color, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
