import 'package:dhan_saarthi/feature/home/presentation/bloc/tab_bar/home_tab_bar_bloc.dart';
import 'package:dhan_saarthi/main.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/home_string_const.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: k454545Color, width: 0.2),
        ),
      ),
      height: 82,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildTab(HomeTabViews.HOME, HomeStringConst.kHome),
          buildTab(HomeTabViews.CHARTS, HomeStringConst.kCharts),
          buildTab(HomeTabViews.WATCHLIST, HomeStringConst.kWatchlist),
        ],
      ),
    );
  }

  Widget buildTab(HomeTabViews tabview, String name) {
    return InkWell(
      onTap: () {
        navigatorKey.currentContext?.read<HomeTabBarBloc>().add(tabview);
      },
      child: BlocBuilder<HomeTabBarBloc, HomeTabViews>(
        builder: (context, state) {
          final bool selected = tabview == state;
          final color = selected ? kBlueColor : k5D5D5DColor;
          return Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 6,
            children: [
              Image.asset(tabview.icon, height: 24, width: 24, color: color),
              Text(
                name,
                style:
                    selected
                        ? semiBoldTextStyle.copyWith(color: color, fontSize: 12)
                        : mediumTextStyle.copyWith(color: color, fontSize: 12),
              ),
            ],
          );
        },
      ),
    );
  }
}
