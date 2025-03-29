import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/is_completed_intro.dart';
import '../../domain/usecase/set_completed_intro.dart';

part 'intro_event.dart';
part 'intro_state.dart';

class IntroBloc extends Bloc<IntroEvent, IntroState> {
  final SetCompletedIntro setCompletedIntro;
  final IsCompletedIntro isCompletedIntro;

  IntroBloc({required this.isCompletedIntro, required this.setCompletedIntro})
    : super(isCompletedIntro.isCompleted ? Login() : IntroInitial()) {
    on<LoginEvent>((event, emit) async {
      setCompletedIntro.call().then(
        (value) => value.fold(
          (failure) => log("setCompletedIntro Failed"),
          (_) => log("setCompletedIntro Success"),
        ),
      );
      emit(Login());
    });
  }
}
