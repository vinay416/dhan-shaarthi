import 'package:dhan_saarthi/feature/watchlist/presentation/bloc/watchlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'watchlist_tabbar.dart';

class WatchlistTabPage extends StatelessWidget {
  const WatchlistTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistBloc, WatchlistState>(
      buildWhen: (previous, current) {
        return (current is WatchlistLoading || current is WatchlistLoaded);
      },
      builder: (context, state) {
        if (state is WatchlistLoading) {
          return CircularProgressIndicator();
        }
        if (state is WatchlistLoaded) {
          return WatchlistTabbar(watchList: state.watchList);
        }
        return Text("failed");
      },
    );
  }
}
