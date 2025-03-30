import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/fund_detail/data/models/fund_invest_details_model.dart';
import 'package:dhan_saarthi/feature/fund_detail/data/models/fund_performace_model.dart';
import 'package:dhan_saarthi/feature/fund_detail/data/models/nav_details_model.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/enitiies/bar_graph_data_entity.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/enitiies/fund_details_entity.dart';
import 'package:dhan_saarthi/feature/fund_detail/presentation/bloc/fund_detail_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mock_get_details.mocks.dart';

void main() {
  final mockUsecase = MockFundDetails();
  final bloc = FundDetailBloc(getFundDetails: mockUsecase);

  group("Fund Bloc", () {
    test("Initial State", () {
      //expect
      expect(bloc.state, FundDetailsLoading());
    });

    test("NAV Detils success", () async {
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
      final fund = FundDetailsEntity(
        fundNav: nav,
        fundInvestment: invest,
        fundPerformance: performance,
      );
      when(mockUsecase.call()).thenAnswer((_) async => Right(fund));
      //expect Later
      expectLater(bloc.stream, emitsInOrder([FundDetailsLoaded(fund)]));
      //act
      bloc.add(InitFundDetail());
    });

    test("NAV Detils success", () async {
      //assert
      when(mockUsecase.call()).thenAnswer((_) async => Left(ServerFailure()));
      //expect Later
      expectLater(bloc.stream, emitsInOrder([FundDetailsError()]));
      //act
      bloc.add(InitFundDetail());
    });
  });
}
