import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/usecase/add_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../repository/mock_watchlist_repo.mocks.dart';

void main() {
  final mockRepo = MockWatchlistRepo();
  final usecase = AddWatchlist(repo: mockRepo);

  test("verify AddWatchlist mockRepo call", () async {
    //assert
    when(mockRepo.addWatchlist(any)).thenAnswer((_) async => Right(unit));
    //act
    final response = await usecase.call("watchlist 1");
    //verify or expect
    verify(mockRepo.addWatchlist(any));
    expect(response, Right(unit));
  });
}
