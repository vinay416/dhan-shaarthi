import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/exceptions.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/fund_detail/data/models/fund_invest_details_model.dart';
import 'package:dhan_saarthi/feature/fund_detail/data/models/fund_performace_model.dart';
import 'package:dhan_saarthi/feature/fund_detail/data/models/nav_details_model.dart';
import 'package:dhan_saarthi/feature/fund_detail/data/repository/fund_details_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mock_fund_remote_source.mocks.dart';

void main() {
  final mockRemoteSource = MockFundRemoteSource();
  final repoImpl = FundDetailsRepositoryImpl(remoteSource: mockRemoteSource);

  group("Fund Repo Impl", () {
    test("Get Nav Success", () async {
      //assert
      final navModel = NavDetailsModel(lineGraphData: [], name: 'name');
      when(mockRemoteSource.getNavDetails()).thenAnswer((_) async => navModel);
      //act
      final response = await repoImpl.getNavDetails();
      //verify or expect
      verify(mockRemoteSource.getNavDetails());
      expect(response, Right(navModel));
    });

    test("Get Nav Failed", () async {
      //assert
      when(mockRemoteSource.getNavDetails()).thenThrow(Exception());
      //act
      final response = await repoImpl.getNavDetails();
      //verify or expect
      verify(mockRemoteSource.getNavDetails());
      expect(response, Left(ServerFailure()));
    });

    test("Get Fund Invest Success", () async {
      //assert
      final investFundModel = FundInvestDetailsModel(
        name: "",
        fundLineGraphData: [],
        investmentLineGraphData: [],
      );
      when(
        mockRemoteSource.getFundInvestDetails(),
      ).thenAnswer((_) async => investFundModel);
      //act
      final response = await repoImpl.getFundInvestDetails();
      //verify or expect
      verify(mockRemoteSource.getFundInvestDetails());
      expect(response, Right(investFundModel));
    });

    test("Get Fund Invest Failed", () async {
      //assert
      when(mockRemoteSource.getFundInvestDetails()).thenThrow(Exception());
      //act
      final response = await repoImpl.getFundInvestDetails();
      //verify or expect
      verify(mockRemoteSource.getFundInvestDetails());
      expect(response, Left(ServerFailure()));
    });

    test("Get fund performace success", () async{
      //assert
      final fundPerformaceModel = FundPerformaceModel(
        name: "",
        graphData: [],
      );
      when(mockRemoteSource.getFundPerformaceDetails()).thenAnswer((_) async =>fundPerformaceModel);
      //act
      final response = await repoImpl.getPerformanceDetails();
      //verify or expect
      verify(mockRemoteSource.getFundPerformaceDetails());
      expect(response, Right(fundPerformaceModel));
    });

    test("Get fund performace failure", () async{
      //assert
      when(mockRemoteSource.getFundPerformaceDetails()).thenThrow(ServerException());
      //act
      final response = await repoImpl.getPerformanceDetails();
      //verify or expect
      verify(mockRemoteSource.getFundPerformaceDetails());
      expect(response, Left(ServerFailure()));
    });
  });
}
