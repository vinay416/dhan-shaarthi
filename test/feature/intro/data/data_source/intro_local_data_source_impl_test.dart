import 'package:dhan_saarthi/core/exceptions.dart';
import 'package:dhan_saarthi/feature/intro/data/data_source/intro_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/prefs_mock/mock_shared_prefs.mocks.dart';

void main() {
  final mockPrefs = MockSharedPrefs();
  final introDataSource = IntroLocalDataSourceImpl(mockPrefs);

  group("GET Intro data source", () {
    test("When prefs null", () {
      //assert
      when(mockPrefs.getBool(any)).thenReturn(null);
      //act
      final response = introDataSource.isIntroCompleted;
      //verify or expect
      verify(mockPrefs.getBool(any));
      expect(response, false);
    });

    test("When prefs true", () {
      //assert
      when(mockPrefs.getBool(any)).thenReturn(true);
      //act
      final response = introDataSource.isIntroCompleted;
      //verify or expect
      verify(mockPrefs.getBool(any));
      expect(response, true);
    });
  });

  group("SET intro data source", () {
    test("Shared prefs set success", () async {
      //assert
      when(mockPrefs.setBool(any, any)).thenAnswer((_) async => true);
      //act
      await introDataSource.setIntroCompleted();
      //verify or expect
      verify(mockPrefs.setBool(any, any));
    });

    test("Shared prefs set failed", () async {
      //assert
      when(mockPrefs.setBool(any, any)).thenAnswer((_) async => false);
      //act
      final call = introDataSource.setIntroCompleted();
      //verify or expect
      verify(mockPrefs.setBool(any, any));
      expect(call, throwsA(TypeMatcher<CacheException>()));
    });
  });
}
