import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/feature/intro/presentation/bloc/intro_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mock_intro_usecases.mocks.dart';

void main() {
  final mockGetIntro = MockGetIntro();
  final mockSetIntro = MockSetIntro();
  when(mockGetIntro.isCompleted).thenReturn(false);
  final bloc = IntroBloc(
    isCompletedIntro: mockGetIntro,
    setCompletedIntro: mockSetIntro,
  );

  group("Intro Bloc when Get Intro", () {
    test("Initial State when false", () {
      expect(bloc.state, IntroInitial());
    });

    test("Initial State when true", () {
      when(mockGetIntro.isCompleted).thenReturn(true);
      final bloc = IntroBloc(
        isCompletedIntro: mockGetIntro,
        setCompletedIntro: mockSetIntro,
      );
      expect(bloc.state, Login());
    });

    test("Login State", () async{
      when(mockSetIntro.call()).thenAnswer((_)async => Right(unit));
      //expect Later - bloc states
      final expected = [Login()];
      expectLater(bloc.stream, emitsInAnyOrder(expected));
      //act
      bloc.add(LoginEvent());
      await untilCalled(mockSetIntro.call());
      verify(mockSetIntro.call());
    });
  });
}
