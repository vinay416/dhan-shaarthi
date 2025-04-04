import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/exceptions.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/watchlist/data/models/watchlist_model.dart';
import 'package:dhan_saarthi/feature/watchlist/data/repository/watchlist_repository_impl.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/enities/fund_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mock_watchlist_local_data_source.mocks.dart';

void main() {
  final mockLocalSource = MockMyWatchlistLocalDataSource();
  final repoImpl = WatchlistRepositoryImpl(localDataSource: mockLocalSource);

  group("Get Watchlist ", () {
    test("Get Watchlist success", () async {
      //assert
      final List<WatchlistModel> expected = [];
      when(mockLocalSource.getWatchlist()).thenAnswer((_) async => expected);
      //act
      final response = await repoImpl.getWatchlist();
      //verify or expect
      verify(mockLocalSource.getWatchlist());
      expect(response, Right(expected));
    });
    test("Get Watchlist failure", () async {
      //assert
      when(mockLocalSource.getWatchlist()).thenThrow(CacheException());
      //act
      final response = await repoImpl.getWatchlist();
      //verify or expect
      verify(mockLocalSource.getWatchlist());
      expect(response, Left(CacheFailure()));
    });
  });

  group("Add Watchlist ", () {
    test("Add Watchlist success", () async {
      //assert
      when(mockLocalSource.addWatchlist(any)).thenAnswer((_) async => unit);
      //act
      final response = await repoImpl.addWatchlist('watchlist 1');
      //verify or expect
      verify(mockLocalSource.addWatchlist(any));
      expect(response, Right(unit));
    });
    test("Add Watchlist failure", () async {
      //assert
      when(mockLocalSource.addWatchlist(any)).thenThrow(CacheException());
      //act
      final response = await repoImpl.addWatchlist('watchlist 1');
      //verify or expect
      verify(mockLocalSource.addWatchlist(any));
      expect(response, Left(CacheFailure()));
    });

    test("Add Watchlist failure when already exist", () async {
      //assert
      when(
        mockLocalSource.addWatchlist(any),
      ).thenThrow(CacheException(msg: "Already exsist"));
      //act
      final response = await repoImpl.addWatchlist('watchlist 1');
      //verify or expect
      verify(mockLocalSource.addWatchlist(any));
      expect(response, Left(CacheFailure(msg: "Already exsist")));
    });
  });

  group("Update Watchlist ", () {
    test("Update Watchlis success", () async {
      //assert
      when(
        mockLocalSource.updateWatchlist(
          newName: anyNamed("newName"),
          oldName: anyNamed("oldName"),
        ),
      ).thenAnswer((_) async => unit);
      //act
      final response = await repoImpl.updateWatchlist(
        oldName: 'watchlist 1',
        newName: 'watchlist new',
      );
      //verify or expect
      verify(
        mockLocalSource.updateWatchlist(
          newName: anyNamed("newName"),
          oldName: anyNamed("oldName"),
        ),
      );
      expect(response, Right(unit));
    });
    test("Update Watchlis failure", () async {
      //assert
      when(
        mockLocalSource.updateWatchlist(
          newName: anyNamed("newName"),
          oldName: anyNamed("oldName"),
        ),
      ).thenThrow(CacheException());
      //act
      final response = await repoImpl.updateWatchlist(
        oldName: 'watchlist 1',
        newName: 'watchlist new',
      );
      //verify or expect
      verify(
        mockLocalSource.updateWatchlist(
          newName: anyNamed("newName"),
          oldName: anyNamed("oldName"),
        ),
      );
      expect(response, Left(CacheFailure()));
    });

    test("Update Watchlis failure, when name is same as old", () async {
      //assert
      when(
        mockLocalSource.updateWatchlist(
          newName: anyNamed("newName"),
          oldName: anyNamed("oldName"),
        ),
      ).thenThrow(CacheException(msg: "Same name"));
      //act
      final response = await repoImpl.updateWatchlist(
        oldName: 'watchlist 1',
        newName: 'watchlist 1',
      );
      //verify or expect
      verify(
        mockLocalSource.updateWatchlist(
          newName: anyNamed("newName"),
          oldName: anyNamed("oldName"),
        ),
      );
      expect(response, Left(CacheFailure(msg: "Same name")));
    });
  });

  group("Delete Watchlist ", () {
    test("Delete Watchlist success", () async {
      //assert
      when(mockLocalSource.deleteWatchlist(any)).thenAnswer((_) async => unit);
      //act
      final response = await repoImpl.deleteWatchlist("watchlist 1");
      //verify or expect
      verify(mockLocalSource.deleteWatchlist(any));
      expect(response, Right(unit));
    });
    test("Delete Watchlist failure", () async {
      //assert
      when(mockLocalSource.deleteWatchlist(any)).thenThrow(CacheException());
      //act
      final response = await repoImpl.deleteWatchlist("watchlist 1");
      //verify or expect
      verify(mockLocalSource.deleteWatchlist(any));
      expect(response, Left(CacheFailure()));
    });
  });

  group("Add Fund to watchlist", () {
    test("If watchlist doesn't exsit", () async {
      //assert
      when(
        mockLocalSource.addFund(
          watchlist: anyNamed("watchlist"),
          fund: anyNamed("fund"),
        ),
      ).thenThrow(CacheException(msg: "watchlist not found!"));
      //act
      final fund = FundEntity(name: "TATA", navValue: "320.0");
      final response = await repoImpl.addFund(
        watchlist: "watchlist 1",
        fund: fund,
      );
      //verify or expect
      expect(response, Left(CacheFailure(msg: "watchlist not found!")));
      verify(
        mockLocalSource.addFund(
          watchlist: anyNamed("watchlist"),
          fund: anyNamed("fund"),
        ),
      );
    });

    test("If watchlist does exsit, fund already added", () async {
      //assert
      when(
        mockLocalSource.addFund(
          watchlist: anyNamed("watchlist"),
          fund: anyNamed("fund"),
        ),
      ).thenThrow(CacheException(msg: "fund already added"));
      //act
      final fund = FundEntity(name: "TATA", navValue: "320.0");
      final response = await repoImpl.addFund(
        watchlist: "watchlist 1",
        fund: fund,
      );
      //verify or expect
      expect(response, Left(CacheFailure(msg: "fund already added")));
      verify(
        mockLocalSource.addFund(
          watchlist: anyNamed("watchlist"),
          fund: anyNamed("fund"),
        ),
      );
    });

    test("If watchlist does exsit, fund already added", () async {
      //assert
      when(
        mockLocalSource.addFund(
          watchlist: anyNamed("watchlist"),
          fund: anyNamed("fund"),
        ),
      ).thenThrow(CacheException(msg: "fund already added"));
      //act
      final fund = FundEntity(name: "TATA", navValue: "320.0");
      final response = await repoImpl.addFund(
        watchlist: "watchlist 1",
        fund: fund,
      );
      //verify or expect
      expect(response, Left(CacheFailure(msg: "fund already added")));
      verify(
        mockLocalSource.addFund(
          watchlist: anyNamed("watchlist"),
          fund: anyNamed("fund"),
        ),
      );
    });

    test("If watchlist fund added success", () async {
      //assert
      when(
        mockLocalSource.addFund(
          watchlist: anyNamed("watchlist"),
          fund: anyNamed("fund"),
        ),
      ).thenAnswer((_) async => unit);
      //act
      final fund = FundEntity(name: "TATA", navValue: "320.0");
      final response = await repoImpl.addFund(
        watchlist: "watchlist 1",
        fund: fund,
      );
      //verify or expect
      expect(response, Right(unit));
      verify(
        mockLocalSource.addFund(
          watchlist: anyNamed("watchlist"),
          fund: anyNamed("fund"),
        ),
      );
    });
  });

  group("Delete Fund", () {
    test("Delete fund doesn't exist", () async {
      //assert
      when(
        mockLocalSource.deleteFund(
          watchlist: anyNamed("watchlist"),
          fund: anyNamed("fund"),
        ),
      ).thenThrow(CacheException(msg: "fund id not found"));
      //act
      final fund = FundEntity(name: "TATA", navValue: "320.98");
      final response = await repoImpl.deleteFund(
        watchlist: "watchlist 1",
        fund: fund,
      );
      //verify or expect
      expect(response, Left(CacheFailure(msg: "fund id not found")));
      verify(
        mockLocalSource.deleteFund(
          watchlist: anyNamed("watchlist"),
          fund: anyNamed("fund"),
        ),
      );
    });

    test("Delete fund exist but failed", () async {
      //assert
      when(
        mockLocalSource.deleteFund(
          watchlist: anyNamed("watchlist"),
          fund: anyNamed("fund"),
        ),
      ).thenThrow(CacheException(msg: "delete failed"));
      //act
      final fund = FundEntity(name: "TATA", navValue: "320.98");
      final response = await repoImpl.deleteFund(
        watchlist: "watchlist 1",
        fund: fund,
      );
      //verify or expect
      expect(response, Left(CacheFailure(msg: "delete failed")));
      verify(
        mockLocalSource.deleteFund(
          watchlist: anyNamed("watchlist"),
          fund: anyNamed("fund"),
        ),
      );
    });

    test("Delete fund success", () async {
      //assert
      when(
        mockLocalSource.deleteFund(
          watchlist: anyNamed("watchlist"),
          fund: anyNamed("fund"),
        ),
      ).thenAnswer((_) async => unit);
      //act
      final fund = FundEntity(name: "TATA", navValue: "320.98");
      final response = await repoImpl.deleteFund(
        watchlist: "watchlist 1",
        fund: fund,
      );
      //verify or expect
      expect(response, Right(unit));
      verify(
        mockLocalSource.deleteFund(
          watchlist: anyNamed("watchlist"),
          fund: anyNamed("fund"),
        ),
      );
    });
  });
}
