import 'package:dhan_saarthi/feature/intro/domain/usecase/is_completed_intro.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mock_intro_repository.mocks.dart';

void main() {
  final mockRepo = MockMyIntroRepository();
  final usecase = IsCompletedIntro(repository: mockRepo);

  test("usecase Intro", () {
    //assert
    when(mockRepo.isCompleted).thenReturn(true);
    //act
    usecase.isCompleted;
    //Verify
    verify(mockRepo.isCompleted);
  });
}
