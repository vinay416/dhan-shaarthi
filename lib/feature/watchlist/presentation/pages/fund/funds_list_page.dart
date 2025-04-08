import 'package:dhan_saarthi/core/string_const/icon_string.dart';
import 'package:dhan_saarthi/core/widgets/custom_app_bar.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/enities/fund_entity.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/enities/watchlist_entity.dart';
import 'package:dhan_saarthi/feature/watchlist/presentation/bloc/watchlist_bloc.dart';
import 'package:dhan_saarthi/feature/watchlist/presentation/widgets/fund/fund_item.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FundsListPage extends StatefulWidget {
  const FundsListPage({super.key, required this.watchlist});
  final WatchlistEntity watchlist;

  @override
  State<FundsListPage> createState() => _FundsListPageState();
}

class _FundsListPageState extends State<FundsListPage> {
  final funds = [
    FundEntity(name: "SBI Direct", navValue: "115.0"),
    FundEntity(name: "TATA AIA", navValue: "320.0"),
    FundEntity(name: "OYO", navValue: "129.56"),
    FundEntity(name: "OLA", navValue: "450.0"),
    FundEntity(name: "Wari Groups", navValue: "5650.0"),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        context.read<WatchlistBloc>().add(InitWatchlistEvent());
      },
      child: Scaffold(
        appBar: CustomAppBar(title: "Funds"),
        body: ListView.separated(
          padding: EdgeInsets.all(24),
          itemBuilder: (context, index) {
            final fund = funds[index];
            return Stack(
              clipBehavior: Clip.none,
              children: [
                FundItem(fund: fund),
                Positioned(
                  top: -20,
                  right: -20,
                  child: IconButton(
                    onPressed: () {
                      context.read<WatchlistBloc>().add(
                        AddFundWatchlistEvent(
                          watchlist: widget.watchlist.id,
                          fund: fund,
                        ),
                      );
                    },
                    icon: Image.asset(
                      kWatchlistIcon,
                      height: 30,
                      width: 30,
                      color: kBlueColor,
                    ),
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 30),
          itemCount: funds.length,
        ),
      ),
    );
  }
}
