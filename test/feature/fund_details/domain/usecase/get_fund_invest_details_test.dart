import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/enitiies/fund_invest_entity.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/usecase/get_fund_invest_details.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../repository/mock_fund_repo.mocks.dart';

void main() {
  final mockRepo = MockFundRepo();
  final getFundInvestUsecase = GetFundInvestDetails(mockRepo);

  test("Get nav details success", () async {
    //assert
    final nav = FundInvestEntity(
      fundLineGraphData: [],
      investmentLineGraphData: [],
      name: "name",
    );
    when(mockRepo.getFundInvestDetails()).thenAnswer((_) async => Right(nav));
    //act
    final response = await getFundInvestUsecase.call();
    //verify or expect
    expect(response, Right(nav));
    verify(mockRepo.getFundInvestDetails());
  });

  test("Get nav details failure", () async {
    //assert
    when(
      mockRepo.getFundInvestDetails(),
    ).thenAnswer((_) async => Left(ServerFailure()));
    //act
    final response = await getFundInvestUsecase.call();
    //verify or expect
    expect(response, Left(ServerFailure()));
    verify(mockRepo.getFundInvestDetails());
  });
}
