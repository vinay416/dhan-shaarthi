import 'dart:async';
import 'package:dhan_saarthi/feature/watchlist/domain/enities/fund_entity.dart';
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
    on<InitWatchlistEvent>(_onInitEvent);
    on<CreateWatchlistEvent>(_onCreateWatchlist);
    on<ChangeWatchlistNameEvent>(_onChangeWatchlistName);
    on<DeleteWatchlistEvent>(_onDeleteWatchlistEvent);
    on<AddFundWatchlistEvent>(_onAddFundWatchlistEvent);
    on<DeleteFundWatchlistEvent>(_onDeleteFundWatchlistEvent);
  }

  FutureOr<void> _onDeleteFundWatchlistEvent(
    DeleteFundWatchlistEvent event,
    emit,
  ) async {
    emit(DeleteFundWatchlistLoading());
    final response = await deleteWatchlistFund.call(
      watchlist: event.watchlist,
      fund: event.fund,
    );
    final state = response.fold(
      (failure) {
        toastHelper.show(failure.msg);
        return DeleteFundWatchlistFailure();
      },
      (unit) {
        return DeletedFundWatchlist();
      },
    );
    emit(state);
  }

  FutureOr<void> _onAddFundWatchlistEvent(
    AddFundWatchlistEvent event,
    emit,
  ) async {
    emit(AddFundWatchlistLoading());
    final response = await addWatchlistFund.call(
      watchlist: event.watchlist,
      fund: event.fund,
    );
    final state = response.fold(
      (failure) {
        toastHelper.show(failure.msg);
        return AddFundWatchlistFailure();
      },
      (unit) {
        return AddedFundWatchlist();
      },
    );
    emit(state);
  }

  FutureOr<void> _onDeleteWatchlistEvent(
    DeleteWatchlistEvent event,
    emit,
  ) async {
    emit(DeleteWatchlistLoading());
    final response = await deleteWatchlist.call(event.name);
    final state = response.fold(
      (failure) {
        toastHelper.show(failure.msg);
        return DeleteWatchlistFailed();
      },
      (unit) {
        return DeletedWatchlist();
      },
    );
    emit(state);
  }

  FutureOr<void> _onChangeWatchlistName(
    ChangeWatchlistNameEvent event,
    emit,
  ) async {
    emit(AddWatchlistLoading());
    final response = await updateWatchlist.call(
      oldName: event.oldName,
      newName: event.newName,
    );
    final state = response.fold(
      (failure) {
        toastHelper.show(failure.msg);
        return WatchlistNameUpdateFailed();
      },
      (unit) {
        return WatchlistNameUpdated();
      },
    );
    emit(state);
  }

  FutureOr<void> _onCreateWatchlist(CreateWatchlistEvent event, emit) async {
    emit(AddWatchlistLoading());
    final response = await addWatchlist.call(event.name);
    final state = response.fold(
      (failure) {
        toastHelper.show(failure.msg);
        return AddWatchlistFailed();
      },
      (unit) {
        return WatchlistAdded();
      },
    );
    emit(state);
  }

  FutureOr<void> _onInitEvent(event, emit) async {
    final response = await getWatchlist.call();
    final state = response.fold(
      (failure) {
        toastHelper.show(failure.msg);
        return WatchlistLoaded([]);
      },
      (watchList) {
        return WatchlistLoaded(watchList);
      },
    );
    emit(state);
  }
}
