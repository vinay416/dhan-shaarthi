import 'dart:convert';

import 'package:dhan_saarthi/core/exceptions.dart';
import 'package:dhan_saarthi/feature/fund_detail/data/data_source/fund_details_remote_source.dart';
import 'package:dhan_saarthi/feature/fund_detail/data/models/fund_invest_details_model.dart';
import 'package:dhan_saarthi/feature/fund_detail/data/models/fund_performace_model.dart';
import 'package:dhan_saarthi/feature/fund_detail/data/models/nav_details_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/dio_mock/mock_dio.mocks.dart';
import '../../../../fixtures/fixtures.dart';

void main() {
  final mockDio = MockMyDio();
  final remoteSource = FundDetailsRemoteSourceImpl(mockDio);

  group("Remote Repo test", () {
    test("Nav details fetch success", () async {
      //assert
      final navJson = jsonDecode(Fixtures().call("nav_details_fixture.json"));
      when(mockDio.get(any)).thenAnswer(
        (_) async => Response(
          data: navJson,
          requestOptions: RequestOptions(),
          statusCode: 200,
        ),
      );
      //act
      final response = await remoteSource.getNavDetails();
      //verify or expect
      verify(mockDio.get(any));
      expect(response, NavDetailsModel.fromJson(navJson));
    });

    test("Nav details fetch failed", () async {
      //assert
      when(mockDio.get(any)).thenThrow(ServerException());
      //act
      final call = remoteSource.getNavDetails();
      //verify or expect
      verify(mockDio.get(any));
      expect(() async => call, throwsA(TypeMatcher<ServerException>()));
    });

    test("Invest Fund details fetch success", () async {
      //assert
      final investFundJson = jsonDecode(
        Fixtures().call("invest_fund_details_fixture.json"),
      );
      when(mockDio.get(any)).thenAnswer(
        (_) async => Response(
          data: investFundJson,
          requestOptions: RequestOptions(),
          statusCode: 200,
        ),
      );
      //act
      final response = await remoteSource.getFundInvestDetails();
      //verify or expect
      verify(mockDio.get(any));
      expect(response, FundInvestDetailsModel.fromJson(investFundJson));
    });

    test("Invest Fund details fetch failed", () async {
      //assert
      when(mockDio.get(any)).thenThrow(Exception());
      //act
      final call = remoteSource.getFundInvestDetails();
      //verify or expect
      verify(mockDio.get(any));
      expect(() async => call, throwsA(TypeMatcher<ServerException>()));
    });


    test("Fund Performance details fetch success", () async {
      //assert
      final fundPerformanceJson = jsonDecode(
        Fixtures().call("fund_performance_fixture.json"),
      );
      when(mockDio.get(any)).thenAnswer(
        (_) async => Response(
          data: fundPerformanceJson,
          requestOptions: RequestOptions(),
          statusCode: 200,
        ),
      );
      //act
      final response = await remoteSource.getFundPerformaceDetails();
      //verify or expect
      verify(mockDio.get(any));
      expect(response, FundPerformaceModel.fromJson(fundPerformanceJson));
    });

    test("Invest Fund details fetch failed", () async {
      //assert
      when(mockDio.get(any)).thenThrow(Exception());
      //act
      final call = remoteSource.getFundPerformaceDetails();
      //verify or expect
      verify(mockDio.get(any));
      expect(() async => call, throwsA(TypeMatcher<ServerException>()));
    });
  });
}
