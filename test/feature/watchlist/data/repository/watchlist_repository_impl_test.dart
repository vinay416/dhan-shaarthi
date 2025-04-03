import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/exceptions.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/watchlist/data/models/watchlist_model.dart';
import 'package:dhan_saarthi/feature/watchlist/data/repository/watchlist_repository_impl.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/enities/watchlist_entity.dart';
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
      final watchlist = WatchlistEntity(id: 'watchlist 1',fundsList: []);
      final response = await repoImpl.addWatchlist(watchlist);
      //verify or expect
      verify(mockLocalSource.addWatchlist(any));
      expect(response, Right(unit));
    });
    test("Add Watchlist failure", () async {
      //assert
      when(mockLocalSource.addWatchlist(any)).thenThrow(CacheException());
      //act
      final watchlist = WatchlistEntity(id: 'watchlist 1',fundsList: []);
      final response = await repoImpl.addWatchlist(watchlist);
      //verify or expect
      verify(mockLocalSource.addWatchlist(any));
      expect(response, Left(CacheFailure()));
    });
  });

  group("Update Watchlist ", () {
    test("Update Watchlis success", () async {
      //assert
      when(mockLocalSource.updateWatchlist(any)).thenAnswer((_) async => unit);
      //act
      final watchlist = WatchlistEntity(id: 'watchlist 1',fundsList: []);
      final response = await repoImpl.updateWatchlist(watchlist);
      //verify or expect
      verify(mockLocalSource.updateWatchlist(any));
      expect(response, Right(unit));
    });
    test("Update Watchlis failure", () async {
      //assert
      when(mockLocalSource.updateWatchlist(any)).thenThrow(CacheException());
      //act
      final watchlist = WatchlistEntity(id: 'watchlist 1',fundsList: []);
      final response = await repoImpl.updateWatchlist(watchlist);
      //verify or expect
      verify(mockLocalSource.updateWatchlist(any));
      expect(response, Left(CacheFailure()));
    });
  });

    group("Delete Watchlist ", () {
    test("Delete Watchlist success", () async {
      //assert
      when(mockLocalSource.deleteWatchlist(any)).thenAnswer((_) async => unit);
      //act
      final watchlist = WatchlistEntity(id: 'watchlist 1',fundsList: []);
      final response = await repoImpl.deleteWatchlist(watchlist);
      //verify or expect
      verify(mockLocalSource.deleteWatchlist(any));
      expect(response, Right(unit));
    });
    test("Delete Watchlist failure", () async {
      //assert
      when(mockLocalSource.deleteWatchlist(any)).thenThrow(CacheException());
      //act
      final watchlist = WatchlistEntity(id: 'watchlist 1',fundsList: []);
      final response = await repoImpl.deleteWatchlist(watchlist);
      //verify or expect
      verify(mockLocalSource.deleteWatchlist(any));
      expect(response, Left(CacheFailure()));
    });
  });
}
