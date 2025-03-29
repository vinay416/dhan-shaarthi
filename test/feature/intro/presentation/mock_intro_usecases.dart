import 'package:dhan_saarthi/feature/intro/domain/usecase/is_completed_intro.dart';
import 'package:dhan_saarthi/feature/intro/domain/usecase/set_completed_intro.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([GetIntro])
class GetIntro extends Mock implements IsCompletedIntro {}

@GenerateMocks([SetIntro])
class SetIntro extends Mock implements SetCompletedIntro {}
