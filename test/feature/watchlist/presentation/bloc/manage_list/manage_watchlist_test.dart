import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/watchlist/presentation/bloc/manage_watchlist/manage_watchlist_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../core/flutter_toast/mock_flutter_toast.mocks.dart';
import '../mock_watchlist_usecases.mocks.dart';

void main() {
  final mockAdd = MockMyAddWatchlist();
  final mockUpdate = MockMyUpdateWatchlist();
  final mockDelete = MockMyDeleteWatchlist();
  final mockToast = MockToast();

  final bloc = ManageWatchlistBloc(
    addWatchlist: mockAdd,
    updateWatchlist: mockUpdate,
    deleteWatchlist: mockDelete,
    toastHelper: mockToast,
  );

  setUp(() {
    when(mockToast.show(any)).thenAnswer((_) async => true);
    when(mockToast.cancelToast()).thenAnswer((_) async => true);
  });

  group("Create new watchlist event", () {
    test("Add new watchlist success", () async {
      //assert
      when(mockAdd.call("watchlist 1")).thenAnswer((_) async => Right(unit));
      //expect Later - bloc states
      final expected = [AddWatchlistLoading(), WatchlistAdded()];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(CreateWatchlistEvent("watchlist 1"));
      await untilCalled(mockAdd.call(any));
      //verify calls
      verify(mockAdd.call(any));
    });

    test("Add new watchlist failure", () async {
      //assert
      when(
        mockAdd.call("watchlist 1"),
      ).thenAnswer((_) async => Left(CacheFailure()));
      //expect Later - bloc states
      final expected = [AddWatchlistLoading(), AddWatchlistFailed()];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(CreateWatchlistEvent("watchlist 1"));
      await untilCalled(mockAdd.call(any));
      //verify calls
      verify(mockAdd.call(any));
    });
  });

  group("Update Watchlist Name event", () {
    test("Update name success", () async {
      //assert
      when(
        mockUpdate.call(
          oldName: anyNamed("oldName"),
          newName: anyNamed("newName"),
        ),
      ).thenAnswer((_) async => Right(unit));
      //expect Later - bloc states
      final expected = [AddWatchlistLoading(), WatchlistNameUpdated()];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(
        ChangeWatchlistNameEvent(oldName: "watchlist 1", newName: "watchlist"),
      );
      await untilCalled(
        mockUpdate.call(
          oldName: anyNamed("oldName"),
          newName: anyNamed("newName"),
        ),
      );
      //verify calls
      verify(
        mockUpdate.call(
          oldName: anyNamed("oldName"),
          newName: anyNamed("newName"),
        ),
      );
    });

    test("Update name failure", () async {
      //assert
      when(
        mockUpdate.call(
          oldName: anyNamed("oldName"),
          newName: anyNamed("newName"),
        ),
      ).thenAnswer((_) async => Left(CacheFailure()));
      //expect Later - bloc states
      final expected = [AddWatchlistLoading(), WatchlistNameUpdateFailed()];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(
        ChangeWatchlistNameEvent(oldName: "watchlist 1", newName: "watchlist"),
      );
      await untilCalled(
        mockUpdate.call(
          oldName: anyNamed("oldName"),
          newName: anyNamed("newName"),
        ),
      );
      //verify calls
      verify(
        mockUpdate.call(
          oldName: anyNamed("oldName"),
          newName: anyNamed("newName"),
        ),
      );
    });
  });

  group("Delete watchlist", () {
    test("Delete success", () async {
      //assert
      when(mockDelete.call(any)).thenAnswer((_) async => Right(unit));
      //expect Later - bloc states
      final expected = [DeleteWatchlistLoading(), DeletedWatchlist()];
      expectLater(bloc.stream, emitsInAnyOrder(expected));
      //act
      bloc.add(DeleteWatchlistEvent("watchlist 1"));
      await untilCalled(mockDelete.call(any));
      //verify calls
      verify(mockDelete.call(any));
    });

    test("Delete failure", () async {
      //assert
      when(mockDelete.call(any)).thenAnswer((_) async => Left(CacheFailure()));
      //expect Later - bloc states
      final expected = [DeleteWatchlistLoading(), DeleteWatchlistFailed()];
      expectLater(bloc.stream, emitsInAnyOrder(expected));
      //act
      bloc.add(DeleteWatchlistEvent("watchlist 1"));
      await untilCalled(mockDelete.call(any));
      //verify calls
      verify(mockDelete.call(any));
    });
  });
}
