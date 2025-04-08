import 'package:dhan_saarthi/feature/watchlist/domain/enities/watchlist_entity.dart';
import 'package:dhan_saarthi/feature/watchlist/presentation/widgets/watchlist_fab.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'fund/funds_tab_view.dart';
import 'watchlist_empty_page.dart';

class WatchlistTabbar extends StatelessWidget {
  const WatchlistTabbar({super.key, required this.watchList});
  final List<WatchlistEntity> watchList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        watchList.isEmpty ? WatchlistEmptyPage() : buildTabView(),
        Positioned(
          bottom: 50,
          right: 20,
          child: WatchlistFAB(watchlistList: watchList),
        ),
      ],
    );
  }

  Widget buildTabView() {
    return DefaultTabController(
      length: watchList.length,
      child: Column(
        spacing: 20,
        children: [
          TabBar(
            tabs: watchList.map(_tab).toList(),
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            labelPadding: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(10),
            indicator: BoxDecoration(
              color: kBlueColor,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Expanded(
            child: TabBarView(children: watchList.map(_tabview).toList()),
          ),
        ],
      ),
    );
  }

  Widget _tab(WatchlistEntity watchList) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Text(
        watchList.id,
        style: semiBoldTextStyle.copyWith(fontSize: 16),
      ),
    );
  }

  Widget _tabview(WatchlistEntity watchList) {
    return FundsTabView(watchlist: watchList);
  }
}
