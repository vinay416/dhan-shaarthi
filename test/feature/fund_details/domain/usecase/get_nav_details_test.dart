import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/enitiies/nav_entity.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/usecase/get_nav_details.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../repository/mock_fund_repo.mocks.dart';
void main() {
  final mockRepo = MockFundRepo();
  final getNavUsecase = GetNavDetails(mockRepo);

  test("Get nav details success", () async{
    //assert
    final nav = NavEntity(lineGraphData: [], name: "name");
    when(mockRepo.getNavDetails()).thenAnswer((_)async => Right(nav));
    //act
    final response = await getNavUsecase.call();
    //verify or expect
    expect(response, Right(nav));
    verify(mockRepo.getNavDetails());
  });

  test("Get nav details failure", () async{
    //assert
    when(mockRepo.getNavDetails()).thenAnswer((_)async => Left(ServerFailure()));
    //act
    final response = await getNavUsecase.call();
    //verify or expect
    expect(response, Left(ServerFailure()));
    verify(mockRepo.getNavDetails());
  });
}