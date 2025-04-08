import 'package:dhan_saarthi/core/widgets/rect_button.dart';
import 'package:flutter/material.dart';

import '../../data/models/watchlist_model.dart';

class WatchlistListBuilder extends StatelessWidget {
  const WatchlistListBuilder({super.key, required this.watchlistList});
  final List<WatchlistModel> watchlistList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final watchlist = watchlistList[index];
        return RectButton(onTap: () {}, title: watchlist.id);
      },
      separatorBuilder: (context, index) => SizedBox(width: 20),
      itemCount: watchlistList.length,
    );
  }
}
