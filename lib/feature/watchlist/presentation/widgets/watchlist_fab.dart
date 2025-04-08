import 'dart:ui';

import 'package:dhan_saarthi/core/widgets/rect_button.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/enities/watchlist_entity.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'manage_watchlist_sheet.dart';

class WatchlistFAB extends StatelessWidget {
  const WatchlistFAB({super.key, required this.watchlistList});
  final List<WatchlistEntity> watchlistList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: RectButton(
        onTap: () {
          showModalBottomSheet(
            context: context,
            useSafeArea: true,
            isScrollControlled: true,
            builder:
                (context) => BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.2, sigmaY: 1.2),
                  child: ManageWatchlistSheet(watchlistList: watchlistList),
                ),
          );
        },
        isEnabled: true,
        title: "edit ",
        icon: Icon(Icons.edit),
        textStyle: mediumTextStyle.copyWith(fontSize: 18, letterSpacing: 0.5),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
