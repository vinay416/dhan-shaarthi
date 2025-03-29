import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([SharedPrefs])
class SharedPrefs extends Mock implements SharedPreferences {}
