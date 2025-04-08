import 'package:dhan_saarthi/core/context.extension.dart';
import 'package:dhan_saarthi/core/widgets/rect_button.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/enities/watchlist_entity.dart';
import 'package:dhan_saarthi/feature/watchlist/presentation/bloc/watchlist_bloc.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/manage_watchlist/manage_watchlist_bloc.dart';

class DeleteWatchlistDialog extends StatelessWidget {
  const DeleteWatchlistDialog({
    super.key,
    required this.title,
    required this.watchlist,
  });
  final String title;
  final WatchlistEntity watchlist;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ManageWatchlistBloc, ManageWatchlistState>(
      listener: (context, state) {
        if (state is DeletedWatchlist) {
          context.read<WatchlistBloc>().add(InitWatchlistEvent());
          context.pop();
        }
      },
      child: Dialog(
        backgroundColor: k262626Color,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 20,
            children: [
              RichText(
                text: TextSpan(
                  text: "Are you sure want to delete ",
                  children: [
                    TextSpan(
                      text: "'${watchlist.id}' ",
                      style: semiBoldTextStyle.copyWith(fontSize: 18),
                    ),
                    TextSpan(text: "$title?"),
                  ],
                  style: mediumTextStyle.copyWith(fontSize: 18),
                ),
                textAlign: TextAlign.center,
              ),
              buildButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButtons(BuildContext context) {
    return BlocSelector<ManageWatchlistBloc, ManageWatchlistState, bool>(
      selector: (state) => state is DeleteWatchlistLoading,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RectButton(
              onTap: () {
                context.read<ManageWatchlistBloc>().add(
                  DeleteWatchlistEvent(watchlist.id),
                );
              },
              title: "Yes, sure",
              isLoading: state,
              isEnabled: true,
            ),
            RectButton(
              onTap: context.pop,
              title: "Cancel",
              backgroundColor: kRedColor,
              isEnabled: !state,
            ),
          ],
        );
      },
    );
  }
}
