import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/enities/fund_entity.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/usecase/add_watchlist_funds.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../repository/mock_watchlist_repo.mocks.dart';

void main() {
  final mockRepo = MockWatchlistRepo();
  final usecase = AddWatchlistFund(repo: mockRepo);

  test("verify AddWatchlist Fund mockRepo call", () async {
    //assert
    when(
      mockRepo.addFund(
        watchlist: anyNamed("watchlist"),
        fund: anyNamed("fund"),
      ),
    ).thenAnswer((_) async => Right(unit));
    //act
    final fund = FundEntity(id: "TATA", navValue: "320.0");
    final response = await usecase.call(watchlist: "watchlist 1", fund: fund);
    //verify or expect
    verify(
      mockRepo.addFund(
        watchlist: anyNamed("watchlist"),
        fund: anyNamed("fund"),
      ),
    );
    expect(response, Right(unit));
  });
}
