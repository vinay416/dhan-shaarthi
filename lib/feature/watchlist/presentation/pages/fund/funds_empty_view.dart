import 'package:dhan_saarthi/core/context.extension.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/enities/watchlist_entity.dart';
import 'package:dhan_saarthi/routes/routes.dart';
import 'package:flutter/material.dart';

import '../../../../../core/string_const/icon_string.dart';
import '../../../../../theme/app_theme.dart';

class FundsEmptyView extends StatelessWidget {
  const FundsEmptyView({super.key, required this.watchlist});
  final WatchlistEntity watchlist;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(kGraphSearchIcon, height: 80),
          SizedBox(height: 20),
          Text(
            "No Funds added!",
            textAlign: TextAlign.center,
            style: mediumTextStyle.copyWith(color: kB0B0B0Color, fontSize: 16),
          ),
          TextButton(
            onPressed:
                () {
                  context.push(Routes.fundsList, arguments: watchlist);
                },
            child: Text(
              "Tap to Add funds",
              style: semiBoldTextStyle.copyWith(
                color: kBlueColor,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
