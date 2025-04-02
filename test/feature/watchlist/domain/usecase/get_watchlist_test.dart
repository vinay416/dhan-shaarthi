import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/enities/watchlist_entity.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/usecase/get_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../repository/mock_watchlist_repo.mocks.dart';

void main() {
  final mockRepo = MockWatchlistRepo();
  final usecase = GetWatchlist(repo: mockRepo);

  test("verify GetWatchlist mockRepo call", () async {
    //assert
    final expected = [WatchlistEntity(fundsList: [], id: "")];
    when(mockRepo.getWatchlist()).thenAnswer((_) async => Right(expected));
    //act
    final response = await usecase.call();
    //verify or expect
    verify(mockRepo.getWatchlist());
    expect(response, Right(expected));
  });
}
