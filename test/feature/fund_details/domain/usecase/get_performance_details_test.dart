import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/enitiies/bar_graph_data_entity.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/enitiies/fund_performace_enity.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/usecase/get_performace_details.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../repository/mock_fund_repo.mocks.dart';

void main() {
  final mockRepo = MockFundRepo();
  final usecase = GetPerformanceDetails(mockRepo);

  test("Get performance details success", () async {
    //assert
    final performance = FundPerformaceEnity(
      name: "",
      graphData: [BarGraphDataEntity(x: 0, barRods: [])],
    );
    when(
      mockRepo.getPerformanceDetails(),
    ).thenAnswer((_) async => Right(performance));
    //act
    final response = await usecase.call();
    //verify or expect
    expect(response, Right(performance));
    verify(mockRepo.getPerformanceDetails());
  });

  test("Get performance details failure", () async {
    //assert
    when(
      mockRepo.getPerformanceDetails(),
    ).thenAnswer((_) async => Left(ServerFailure()));
    //act
    final response = await usecase.call();
    //verify or expect
    expect(response, Left(ServerFailure()));
    verify(mockRepo.getPerformanceDetails());
  });
}
