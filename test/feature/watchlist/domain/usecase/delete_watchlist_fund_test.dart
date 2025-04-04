import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/enities/fund_entity.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/usecase/add_watchlist_funds.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/usecase/delete_watchlist_fund.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../repository/mock_watchlist_repo.mocks.dart';

void main() {
  final mockRepo = MockWatchlistRepo();
  final usecase = DeleteWatchlistFund(repo: mockRepo);

  test("verify Delete fund mockRepo call", () async {
    //assert
    when(
      mockRepo.deleteFund(
        watchlist: anyNamed("watchlist"),
        fund: anyNamed("fund"),
      ),
    ).thenAnswer((_) async => Right(unit));
    //act
    final fund = FundEntity(name: "TATA AIA", navValue: "350.0");
    final response = await usecase.call(watchlist: "watchlist 1", fund: fund);
    //verify or expect
    verify(
      mockRepo.deleteFund(
        watchlist: anyNamed("watchlist"),
        fund: anyNamed("fund"),
      ),
    );
    expect(response, Right(unit));
  });
}
