import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/fund_detail/data/models/fund_details_model.dart';
import 'package:dhan_saarthi/feature/fund_detail/data/models/fund_invest_details_model.dart';
import 'package:dhan_saarthi/feature/fund_detail/data/models/fund_performace_model.dart';
import 'package:dhan_saarthi/feature/fund_detail/data/models/nav_details_model.dart';
import 'package:dhan_saarthi/feature/fund_detail/data/repository/fund_details_repository_impl.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/enitiies/bar_graph_data_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mock_fund_remote_source.mocks.dart';

void main() {
  final mockRemoteSource = MockFundRemoteSource();
  final repoImpl = FundDetailsRepositoryImpl(remoteSource: mockRemoteSource);

  group("Fund Repo Impl", () {
    test("Get Details Success", () async {
      //assert
      final nav = NavDetailsModel(lineGraphData: [], name: "name");
      final invest = FundInvestDetailsModel(
        fundLineGraphData: [],
        investmentLineGraphData: [],
        name: "name",
      );
      final performance = FundPerformaceModel(
        name: "",
        graphData: [BarGraphDataEntity(x: 0, barRods: [])],
      );
      final fund = FundDetailsModel(
        fundNav: nav,
        fundInvestment: invest,
        fundPerformance: performance,
      );
      when(mockRemoteSource.getNavDetails()).thenAnswer((_) async => nav);
      when(mockRemoteSource.getFundInvestDetails()).thenAnswer((_) async => invest);
      when(mockRemoteSource.getFundPerformaceDetails()).thenAnswer((_) async => performance);
      //act
      final response = await repoImpl.getFundDetails();
      //verify or expect
      verify(mockRemoteSource.getNavDetails());
      expect(response, Right(fund));
    });

    test("Get Nav Failed", () async {
      //assert
      when(mockRemoteSource.getNavDetails()).thenThrow(Exception());
      //act
      final response = await repoImpl.getFundDetails();
      //verify or expect
      verify(mockRemoteSource.getNavDetails());
      expect(response, Left(ServerFailure()));
    });
  });
}
