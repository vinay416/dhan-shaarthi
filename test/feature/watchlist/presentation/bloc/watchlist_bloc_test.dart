import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/enities/watchlist_entity.dart';
import 'package:dhan_saarthi/feature/watchlist/presentation/bloc/watchlist_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/flutter_toast/mock_flutter_toast.mocks.dart';
import 'mock_watchlist_usecases.mocks.dart';

void main() {
  final mockGet = MockMyGetWatchlist();
  final mockAdd = MockMyAddWatchlist();
  final mockUpdate = MockMyUpdateWatchlist();
  final mockDelete = MockMyDeleteWatchlist();
  final mockToast = MockToast();

  final bloc = WatchlistBloc(
    getWatchlist: mockGet,
    addWatchlist: mockAdd,
    updateWatchlist: mockUpdate,
    deleteWatchlist: mockDelete,
    toastHelper: mockToast,
  );

  group("Watchlist bloc", () {
    setUp(() {
      when(mockToast.show(any)).thenAnswer((_) async => true);
      when(mockToast.cancelToast()).thenAnswer((_) async => true);
    });
    test("Initial state", () {
      //expect
      expect(bloc.state, WatchlistLoading());
    });

    test("When InitEvent fired and success", () async {
      //assert
      final watchlist = WatchlistEntity(id: "watchlist 1", fundsList: []);
      when(mockGet.call()).thenAnswer((_) async => Right([watchlist]));
      //expect Later - bloc states
      final expected = [
        WatchlistLoaded([watchlist]),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(InitWatchlist());
      await untilCalled(mockGet.call());
      //verify calls
      verify(mockGet.call());
    });

    test("When InitEvent fired and failure", () async {
      //assert
      when(mockGet.call()).thenAnswer((_) async => Left(CacheFailure()));
      //expect Later - bloc states
      final expected = [WatchlistLoaded([])];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(InitWatchlist());
      await untilCalled(mockGet.call());
      await untilCalled(mockToast.show(any));
      //verify calls
      verify(mockToast.show(any));
      verify(mockGet.call());
    });

    test("Add new watchlist", ()async{
      //assert
      final watchlist = WatchlistEntity(id: "watchlist 1", fundsList: []);
      when(mockAdd.call(watchlist)).thenAnswer((_)async=> Right(unit));
      //expect Later - bloc states
      final expected = [LoadingAddWatchlist(), WatchlistAdded()];
      expectLater(bloc.stream, emitsInOrder(expected));
      //act
      bloc.add(InitWatchlist());
      await untilCalled(mockGet.call());
      //verify calls
    });
  });
}
