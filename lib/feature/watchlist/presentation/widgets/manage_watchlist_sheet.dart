import 'dart:ui';

import 'package:dhan_saarthi/core/context.extension.dart';
import 'package:dhan_saarthi/core/widgets/rect_button.dart';
import 'package:dhan_saarthi/feature/watchlist/presentation/widgets/watchlist_edit_sheet.dart';
import 'package:dhan_saarthi/main.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../domain/enities/watchlist_entity.dart';
import 'delete_watchlist_dialog.dart';

class ManageWatchlistSheet extends StatelessWidget {
  const ManageWatchlistSheet({super.key, required this.watchlistList});
  final List<WatchlistEntity> watchlistList;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: watchlistList.isEmpty ? 0.13 : 0.5,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: k262626Color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          border: Border.all(color: k5D5D5DColor),
        ),
        child: Column(
          children: [
            if (watchlistList.isNotEmpty)
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(24),
                  itemBuilder: (context, index) {
                    return mapWatchlist(context, watchlistList[index]);
                  },
                  separatorBuilder: (context, index) {
                    return Divider(color: k454545Color);
                  },
                  itemCount: watchlistList.length,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: RectButton(
                onTap: () {
                  final empty = WatchlistEntity.empty();
                  navigateToNewSheet(context, empty);
                },
                title: "Create new",
                isEnabled: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToNewSheet(BuildContext context, WatchlistEntity watchList) {
    context.pop();
    showModalBottomSheet(
      context: navigatorKey.currentContext!,
      isScrollControlled: true,
      builder:
          (context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1.2, sigmaY: 1.2),
            child: WatchlistEditSheet(watchlist: watchList),
          ),
    );
  }

  void showDeleteDialog(BuildContext context, WatchlistEntity watchList) {
    context.pop();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => PopScope(
            canPop: false,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.2, sigmaY: 1.2),
              child: DeleteWatchlistDialog(
                title: "watchlist with Funds",
                watchlist: watchList,
              ),
            ),
          ),
    );
  }

  Widget mapWatchlist(BuildContext context, WatchlistEntity watchList) {
    return Row(
      spacing: 10,
      children: [
        IconButton(
          onPressed: () => showDeleteDialog(context, watchList),
          icon: Icon(Icons.delete, color: kRedColor),
        ),
        Spacer(),
        Text(watchList.id, style: mediumTextStyle.copyWith(fontSize: 18)),
        IconButton(
          onPressed: () => navigateToNewSheet(context, watchList),
          icon: Icon(Icons.edit, color: kBlueColor),
        ),
      ],
    );
  }

  Widget buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.edit, color: kBlueColor),
          ),
          IconButton(
            onPressed: null,
            icon: Icon(Icons.delete, color: kRedColor),
          ),
        ],
      ),
    );
  }
}
