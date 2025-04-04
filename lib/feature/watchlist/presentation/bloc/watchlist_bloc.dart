import 'dart:async';
import 'package:dhan_saarthi/feature/watchlist/domain/enities/watchlist_entity.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/usecase/add_watchlist_funds.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/usecase/delete_watchlist_fund.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/toast_helper..dart';
import '../../domain/usecase/add_watchlist.dart';
import '../../domain/usecase/delete_watchlist.dart';
import '../../domain/usecase/get_watchlist.dart';
import '../../domain/usecase/update_watchlist.dart';

part 'watchlist_event.dart';
part 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  final GetWatchlist getWatchlist;
  final AddWatchlist addWatchlist;
  final UpdateWatchlist updateWatchlist;
  final DeleteWatchlist deleteWatchlist;
  final AddWatchlistFund addWatchlistFund;
  final DeleteWatchlistFund deleteWatchlistFund;
  final ToastHelper toastHelper;
  WatchlistBloc({
    required this.getWatchlist,
    required this.addWatchlist,
    required this.updateWatchlist,
    required this.deleteWatchlist,
    required this.addWatchlistFund,
    required this.deleteWatchlistFund,
    required this.toastHelper,
  }) : super(WatchlistLoading()) {
    on<InitWatchlist>(_onInitEvent);
  }

  FutureOr<void> _onInitEvent(event, emit) async {
    final response = await getWatchlist.call();
    final state = response.fold((failure) {
      toastHelper.show(failure.msg);
      return WatchlistLoaded([]);
    }, (watchList) => WatchlistLoaded(watchList));
    emit(state);
  }
}
