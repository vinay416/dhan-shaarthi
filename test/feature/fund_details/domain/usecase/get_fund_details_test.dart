import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/enitiies/bar_graph_data_entity.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/enitiies/fund_details_entity.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/enitiies/fund_invest_entity.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/enitiies/fund_performace_enity.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/enitiies/nav_entity.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/usecase/get_fund_details.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../repository/mock_fund_repo.mocks.dart';

void main() {
  final mockRepo = MockFundRepo();
  final getFundUsecase = GetFundDetails(mockRepo);

  test("Get nav details success", () async {
    //assert
    final nav = NavEntity(lineGraphData: [], name: "name");
    final invest = FundInvestEntity(
      fundLineGraphData: [],
      investmentLineGraphData: [],
      name: "name",
    );
    final performance = FundPerformaceEntity(
      name: "",
      graphData: [BarGraphDataEntity(x: 0, barRods: [])],
    );
    final fund = FundDetailsEntity(
      fundNav: nav,
      fundInvestment: invest,
      fundPerformance: performance,
    );

    when(mockRepo.getFundDetails()).thenAnswer((_) async => Right(fund));
    //act
    final response = await getFundUsecase.call();
    //verify or expect
    expect(response, Right(fund));
    verify(mockRepo.getFundDetails());
  });

  test("Get nav details failure", () async {
    //assert
    when(
      mockRepo.getFundDetails(),
    ).thenAnswer((_) async => Left(ServerFailure()));
    //act
    final response = await getFundUsecase.call();
    //verify or expect
    expect(response, Left(ServerFailure()));
    verify(mockRepo.getFundDetails());
  });
}
