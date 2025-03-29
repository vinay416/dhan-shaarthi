import 'package:dhan_saarthi/feature/auth/data/data_sources/auth_remote_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([AuthRemote])
class AuthRemote extends Mock implements AuthRemoteSource {}
