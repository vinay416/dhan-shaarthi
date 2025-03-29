// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dhan_saarthi/feature/intro/domain/repository/intro_repository.dart';

class IsCompletedIntro {
  final IntroRepository repository;
  const IsCompletedIntro({
    required this.repository,
  });

  bool get isCompleted{
    return repository.isCompleted;
  }
}
