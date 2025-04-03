import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/usecase/delete_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../repository/mock_watchlist_repo.mocks.dart';

void main() {
  final mockRepo = MockWatchlistRepo();
  final usecase = DeleteWatchlist(repo: mockRepo);

  test("verify DeleteWatchlist mockRepo call", () async {
    //assert
    when(mockRepo.deleteWatchlist(any)).thenAnswer((_) async => Right(unit));
    //act
    final response = await usecase.call("watchlist 1");
    //verify or expect
    verify(mockRepo.deleteWatchlist(any));
    expect(response, Right(unit));
  });
}
