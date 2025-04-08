import 'package:dhan_saarthi/core/widgets/custom_app_bar.dart';
import 'package:dhan_saarthi/feature/home/presentation/utils/home_string_const.dart';
import 'package:dhan_saarthi/feature/home/presentation/widgets/home_tab_bar.dart';
import 'package:dhan_saarthi/feature/watchlist/presentation/pages/watchlist_tab_page.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/watchlist_bloc.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key});

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  @override
  void initState() {
    super.initState();
    context.read<WatchlistBloc>().add(InitWatchlistEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: false,
        title: HomeStringConst.kWatchlist,
        textStyle: semiBoldTextStyle.copyWith(fontSize: 24),
      ),
      body: Column(
        children: [
          Expanded(child: WatchlistTabPage()),
          SizedBox(height: KHomeTabHeight),
        ],
      ),
    );
  }
}
