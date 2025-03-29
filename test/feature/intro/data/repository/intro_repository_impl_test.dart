import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/intro/data/repository/intro_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mock_intro_local_data_source.mocks.dart';

void main() {
  final mockDataSouce = MockMyIntroLocalDataSource();
  final introRepo = IntroRepositoryImpl(mockDataSouce);

  group("GET intro", () {
    test("Get Intro Already viewed", () {
      //assert
      when(mockDataSouce.isIntroCompleted).thenReturn(false);
      //act
      final response = introRepo.isCompleted;
      //verify or expect
      verify(mockDataSouce.isIntroCompleted);
      expect(response, false);
    });

    test("GET Intro first time view", () {
      //assert
      when(mockDataSouce.isIntroCompleted).thenReturn(true);
      //act
      final response = introRepo.isCompleted;
      //verify or expect
      verify(mockDataSouce.isIntroCompleted);
      expect(response, true);
    });
  });

  group("Set intro", () {
    test("Set intro completed success", () async {
      //assert
      when(mockDataSouce.setIntroCompleted()).thenAnswer((_) async => unit);
      //act
      final response = await introRepo.setIntroCompleted();
      //verify or expect
      verify(mockDataSouce.setIntroCompleted());
      expect(response, Right(unit));
    });

    test("Set intro failed", () async {
      //assert
      when(mockDataSouce.setIntroCompleted()).thenThrow(Exception());
      //act
      final response = await introRepo.setIntroCompleted();
      //verify or expect
      verify(mockDataSouce.setIntroCompleted());
      expect(response, Left(CacheFailure()));
    });
  });
}
