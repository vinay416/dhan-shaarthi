import 'package:dhan_saarthi/core/context.extension.dart';
import 'package:dhan_saarthi/core/widgets/rect_button.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/enities/watchlist_entity.dart';
import 'package:dhan_saarthi/feature/watchlist/presentation/pages/fund/funds_empty_view.dart';
import 'package:dhan_saarthi/feature/watchlist/presentation/widgets/fund/fund_item.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../routes/routes.dart';
import '../../bloc/watchlist_bloc.dart';

class FundsTabView extends StatelessWidget {
  const FundsTabView({super.key, required this.watchlist});
  final WatchlistEntity watchlist;

  @override
  Widget build(BuildContext context) {
    final funds = watchlist.fundsList;
    if (funds.isEmpty) {
      return FundsEmptyView(watchlist: watchlist);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: SizedBox(
            width: 135,
            height: 30,
            child: RectButton(
              onTap: () {
                context.push(Routes.fundsList, arguments: watchlist);
              },
              title: "Add Fund ",
              icon: Icon(Icons.add),
              isEnabled: true,
            ),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.all(24).copyWith(top: 10),
            itemBuilder: (context, index) {
              final fund = funds[index];
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  FundItem(fund: fund),
                  Positioned(
                    top: -20,
                    right: -24,
                    child: IconButton(
                      onPressed: () {
                        context.read<WatchlistBloc>().add(
                          DeleteFundWatchlistEvent(
                            watchlist: watchlist.id,
                            fund: fund,
                          ),
                        );
                        context.read<WatchlistBloc>().add(InitWatchlistEvent());
                      },
                      icon: Icon(Icons.delete, color: kRedColor),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 30),
            itemCount: funds.length,
          ),
        ),
      ],
    );
  }
}
