import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/toast_helper..dart';
import '../../../domain/usecase/add_watchlist.dart';
import '../../../domain/usecase/delete_watchlist.dart';
import '../../../domain/usecase/update_watchlist.dart';

part 'manage_watchlist_event.dart';
part 'manage_watchlist_state.dart';

class ManageWatchlistBloc
    extends Bloc<ManageWatchlistEvent, ManageWatchlistState> {
  final AddWatchlist addWatchlist;
  final UpdateWatchlist updateWatchlist;
  final DeleteWatchlist deleteWatchlist;
  final ToastHelper toastHelper;
  ManageWatchlistBloc({
    required this.addWatchlist,
    required this.updateWatchlist,
    required this.deleteWatchlist,
    required this.toastHelper,
  }) : super(InitialManageWatchList()) {
    on<CreateWatchlistEvent>(_onCreateWatchlist);
    on<ChangeWatchlistNameEvent>(_onChangeWatchlistName);
    on<DeleteWatchlistEvent>(_onDeleteWatchlistEvent);
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
}
