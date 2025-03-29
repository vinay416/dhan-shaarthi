import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/feature/intro/domain/usecase/set_completed_intro.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mock_intro_repository.mocks.dart';

void main() {
  final mockRepo = MockMyIntroRepository();
  final usecase = SetCompletedIntro(mockRepo);

  test("usecase set Intro", () async {
    //assert
    when(mockRepo.setIntroCompleted()).thenAnswer((_) async => Right(unit));
    //act
    await usecase.call();
    //Verify
    verify(mockRepo.setIntroCompleted());
  });
}
