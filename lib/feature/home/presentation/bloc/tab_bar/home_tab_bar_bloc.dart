// ignore_for_file: constant_identifier_names

import 'package:dhan_saarthi/core/string_const/icon_string.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabBarBloc extends Bloc<HomeTabViews, HomeTabViews> {
  HomeTabBarBloc() : super(HomeTabViews.HOME) {
    on<HomeTabViews>((event, emit) {
      emit(event);
    });
  }
}

enum HomeTabViews {
  HOME(kHomeIcon),
  CHARTS(kChartsIcon),
  WATCHLIST(kWatchlistIcon);

  final String icon;
  const HomeTabViews(this.icon);
}
