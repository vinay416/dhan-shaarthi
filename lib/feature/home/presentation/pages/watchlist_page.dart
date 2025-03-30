import 'package:dhan_saarthi/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../utils/home_string_const.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(leading: false, title: HomeStringConst.kWatchlist),
    );
  }
}
