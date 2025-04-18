import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/enities/fund_entity.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/enities/watchlist_entity.dart';
import 'package:dhan_saarthi/feature/watchlist/presentation/bloc/watchlist_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/flutter_toast/mock_flutter_toast.mocks.dart';
import 'mock_watchlist_usecases.mocks.dart';

void main() {
  final mockGet = MockMyGetWatchlist();
  final mockFundAdd = MockMyAddWatchlistFund();
  final mockFundDelete = MockMyDeleteWatchlistFund();
  final mockToast = MockToast();

  final bloc = WatchlistBloc(
    getWatchlist: mockGet,
    addWatchlistFund: mockFundAdd,
    deleteWatchlistFund: mockFundDelete,
    toastHelper: mockToast,
  );

  setUp(() {
    when(mockToast.show(any)).thenAnswer((_) async => true);
    when(mockToast.cancelToast()).thenAnswer((_) async => true);
  });

  group("Watchlist bloc", () {
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
      bloc.add(InitWatchlistEvent());
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
      bloc.add(InitWatchlistEvent());
      await untilCalled(mockGet.call());
      await untilCalled(mockToast.show(any));
      //verify calls
      verify(mockToast.show(any));
      verify(mockGet.call());
    });
  });

  group("Add Funds to watchlist", () {
    test("Add fund success", () async {
      //assert
      when(
        mockFundAdd.call(
          watchlist: "watchlist",
          fund: FundEntity(name: "TATA", navValue: "320.0"),
        ),
      ).thenAnswer((_) async => Right(unit));
      //expect Later - bloc states
      final expected = [AddFundWatchlistLoading(), AddedFundWatchlist()];
      expectLater(bloc.stream, emitsInAnyOrder(expected));
      //act
      bloc.add(
        AddFundWatchlistEvent(
          watchlist: "watchlist",
          fund: FundEntity(name: "TATA", navValue: "320.0"),
        ),
      );
      await untilCalled(
        mockFundAdd.call(
          watchlist: "watchlist",
          fund: FundEntity(name: "TATA", navValue: "320.0"),
        ),
      );
      //verify calls
      verify(
        mockFundAdd.call(
          watchlist: "watchlist",
          fund: FundEntity(name: "TATA", navValue: "320.0"),
        ),
      );
    });

    test("Add fund failure", () async {
      //assert
      when(
        mockFundAdd.call(
          watchlist: "watchlist",
          fund: FundEntity(name: "TATA", navValue: "320.0"),
        ),
      ).thenAnswer((_) async => Left(CacheFailure()));
      //expect Later - bloc states
      final expected = [AddFundWatchlistLoading(), AddFundWatchlistFailure()];
      expectLater(bloc.stream, emitsInAnyOrder(expected));
      //act
      bloc.add(
        AddFundWatchlistEvent(
          watchlist: "watchlist",
          fund: FundEntity(name: "TATA", navValue: "320.0"),
        ),
      );
      await untilCalled(
        mockFundAdd.call(
          watchlist: "watchlist",
          fund: FundEntity(name: "TATA", navValue: "320.0"),
        ),
      );
      //verify calls
      verify(
        mockFundAdd.call(
          watchlist: "watchlist",
          fund: FundEntity(name: "TATA", navValue: "320.0"),
        ),
      );
    });
  });

  group("Delete Funds to watchlist", () {
    test("Delete fund success", () async {
      //assert
      when(
        mockFundDelete.call(
          watchlist: "watchlist",
          fund: FundEntity(name: "TATA", navValue: "320.0"),
        ),
      ).thenAnswer((_) async => Right(unit));
      //expect Later - bloc states
      final expected = [DeleteFundWatchlistLoading(), DeletedFundWatchlist()];
      expectLater(bloc.stream, emitsInAnyOrder(expected));
      //act
      bloc.add(
        DeleteFundWatchlistEvent(
          watchlist: "watchlist",
          fund: FundEntity(name: "TATA", navValue: "320.0"),
        ),
      );
      await untilCalled(
        mockFundDelete.call(
          watchlist: "watchlist",
          fund: FundEntity(name: "TATA", navValue: "320.0"),
        ),
      );
      //verify calls
      verify(
        mockFundDelete.call(
          watchlist: "watchlist",
          fund: FundEntity(name: "TATA", navValue: "320.0"),
        ),
      );
    });

    test("Add fund failure", () async {
      //assert
      when(
        mockFundDelete.call(
          watchlist: "watchlist",
          fund: FundEntity(name: "TATA", navValue: "320.0"),
        ),
      ).thenAnswer((_) async => Left(CacheFailure()));
      //expect Later - bloc states
      final expected = [
        DeleteFundWatchlistLoading(),
        DeleteFundWatchlistFailure(),
      ];
      expectLater(bloc.stream, emitsInAnyOrder(expected));
      //act
      bloc.add(
        DeleteFundWatchlistEvent(
          watchlist: "watchlist",
          fund: FundEntity(name: "TATA", navValue: "320.0"),
        ),
      );
      await untilCalled(
        mockFundDelete.call(
          watchlist: "watchlist",
          fund: FundEntity(name: "TATA", navValue: "320.0"),
        ),
      );
      //verify calls
      verify(
        mockFundDelete.call(
          watchlist: "watchlist",
          fund: FundEntity(name: "TATA", navValue: "320.0"),
        ),
      );
    });
  });
}
