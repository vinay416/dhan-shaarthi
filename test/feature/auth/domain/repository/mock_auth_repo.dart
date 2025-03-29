import 'package:dhan_saarthi/feature/auth/domain/repository/auth_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([MyAuthRepo])
class MyAuthRepo extends Mock implements AuthRepository {}
