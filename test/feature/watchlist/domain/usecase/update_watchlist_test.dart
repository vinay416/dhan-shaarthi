import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/usecase/update_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../repository/mock_watchlist_repo.mocks.dart';

void main() {
  final mockRepo = MockWatchlistRepo();
  final usecase = UpdateWatchlist(repo: mockRepo);

  test("verify UpdateWatchlist mockRepo call", () async {
    //assert
    when(
      mockRepo.updateWatchlist(
        oldName: anyNamed("oldName"),
        newName: anyNamed("newName"),
      ),
    ).thenAnswer((_) async => Right(unit));
    //act
    final response = await usecase.call(
      oldName: "watchlist 1",
      newName: "watchlist new",
    );
    //verify or expect
    verify(
      mockRepo.updateWatchlist(
        oldName: anyNamed("oldName"),
        newName: anyNamed("newName"),
      ),
    );
    expect(response, Right(unit));
  });
}
