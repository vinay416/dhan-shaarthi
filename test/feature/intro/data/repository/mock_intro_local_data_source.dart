import 'package:dhan_saarthi/feature/intro/data/data_source/intro_local_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([MyIntroLocalDataSource])
class MyIntroLocalDataSource extends Mock implements IntroLocalDataSource {}
