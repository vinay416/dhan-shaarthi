import 'package:dhan_saarthi/feature/home/presentation/pages/charts_page.dart';
import 'package:dhan_saarthi/feature/home/presentation/pages/home_page.dart';
import 'package:dhan_saarthi/feature/home/presentation/pages/watchlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/tab_bar/home_tab_bar_bloc.dart';
import '../widgets/home_tab_bar.dart';

class TabViewPages extends StatelessWidget {
  const TabViewPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          BlocBuilder<HomeTabBarBloc, HomeTabViews>(
            builder: (context, state) {
              if (state == HomeTabViews.CHARTS) {
                return ChartsPage();
              }
              if (state == HomeTabViews.WATCHLIST) {
                return WatchlistPage();
              }
              return HomePage();
            },
          ),
          Positioned(bottom: 0, child: HomeTabBar()),
        ],
      ),
    );
  }
}
