// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dhan_saarthi/core/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IntroLocalDataSource {
  bool get isIntroCompleted;
  Future<void> setIntroCompleted();
}

// ignore: constant_identifier_names
const String INTRO_PREFS_KEY = "INTRO_PREFS_KEY";

class IntroLocalDataSourceImpl implements IntroLocalDataSource {
  final SharedPreferences preferences;
  const IntroLocalDataSourceImpl(this.preferences);

  @override
  bool get isIntroCompleted {
    return preferences.getBool(INTRO_PREFS_KEY) ?? false;
  }
  
  @override
  Future<void> setIntroCompleted() async {
    final response = await preferences.setBool(INTRO_PREFS_KEY, true);
    if(!response) throw CacheException();
  }
}
