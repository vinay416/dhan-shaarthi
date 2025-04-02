import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/enities/watchlist_entity.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/usecase/update_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../repository/mock_watchlist_repo.mocks.dart';

void main() {
  final mockRepo = MockWatchlistRepo();
  final usecase = UpdateWatchlist(repo: mockRepo);

  test("verify UpdateWatchlist mockRepo call", () async {
    //assert
    final expected = [WatchlistEntity(fundsList: [], id: "")];
    when(mockRepo.updateWatchlist(any)).thenAnswer((_) async => Right(unit));
    //act
    final response = await usecase.call(expected.first);
    //verify or expect
    verify(mockRepo.updateWatchlist(any));
    expect(response, Right(unit));
  });
}
