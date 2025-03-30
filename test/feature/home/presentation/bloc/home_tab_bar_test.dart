import 'package:dhan_saarthi/feature/home/presentation/bloc/tab_bar/home_tab_bar_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final bloc = HomeTabBarBloc();

  group("Tab-Bar Tests", () {
    test("Initial state", () {
      //expect
      expect(bloc.state, HomeTabViews.HOME);
    });

    test("Home state", () {
      //expect Later
      expectLater(bloc.stream, emitsInOrder([HomeTabViews.HOME]));
      //act
      bloc.add(HomeTabViews.HOME);
    });

    test("Charts state", () {
      //expect Later
      expectLater(bloc.stream, emitsInOrder([HomeTabViews.CHARTS]));
      //act
      bloc.add(HomeTabViews.CHARTS);
    });

    test("Watchlist state", () {
      //expect Later
      expectLater(bloc.stream, emitsInOrder([HomeTabViews.WATCHLIST]));
      //act
      bloc.add(HomeTabViews.WATCHLIST);
    });
  });
}
