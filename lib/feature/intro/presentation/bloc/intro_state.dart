part of 'intro_bloc.dart';

sealed class IntroState extends Equatable {
  const IntroState();
  
  @override
  List<Object> get props => [];
}

final class IntroInitial extends IntroState {}

final class Login extends IntroState {}
