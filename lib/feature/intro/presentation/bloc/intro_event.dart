part of 'intro_bloc.dart';

sealed class IntroEvent extends Equatable {
  const IntroEvent();

  @override
  List<Object> get props => [];
}

final class LoginEvent extends IntroEvent{}