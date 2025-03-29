import 'package:dhan_saarthi/feature/intro/domain/repository/intro_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([MyIntroRepository])
class MyIntroRepository extends Mock implements IntroRepository {}
