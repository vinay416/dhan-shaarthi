import 'package:dhan_saarthi/core/exceptions.dart';
import 'package:dio/dio.dart';

import '../models/fund_invest_details_model.dart';
import '../models/fund_performace_model.dart';
import '../models/nav_details_model.dart';

abstract class FundDetailsRemoteSource {
  Future<NavDetailsModel> getNavDetails();
  Future<FundInvestDetailsModel> getFundInvestDetails();
  Future<FundPerformaceModel> getFundPerformaceDetails();
}

// ignore: constant_identifier_names
const String GET_NAV_DETAILS =
    "https://mocki.io/v1/ded818bf-fcaf-416c-9d01-f1bd52ce681c";
// ignore: constant_identifier_names
const String GET_INVESTMENT_DETAILS =
    "https://mocki.io/v1/33d74063-2aae-4ee3-84d6-ab70e8d5925b";
// ignore: constant_identifier_names
const String GET_PERFORMANCE_DETAILS =
    "https://mocki.io/v1/2550ed18-198d-4a3d-a583-d7c091b7ffa6";

class FundDetailsRemoteSourceImpl implements FundDetailsRemoteSource {
  FundDetailsRemoteSourceImpl(this.dio);
  final Dio dio;

  @override
  Future<FundInvestDetailsModel> getFundInvestDetails() async {
    try {
      final response = await dio.get(GET_INVESTMENT_DETAILS);
      if (response.statusCode != 200) throw response;
      return FundInvestDetailsModel.fromJson(response.data);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<NavDetailsModel> getNavDetails() async {
    try {
      final response = await dio.get(GET_NAV_DETAILS);
      if (response.statusCode != 200) throw response;
      return NavDetailsModel.fromJson(response.data);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<FundPerformaceModel> getFundPerformaceDetails() async {
    try {
      final response = await dio.get(GET_PERFORMANCE_DETAILS);
      if (response.statusCode != 200) throw response;
      return FundPerformaceModel.fromJson(response.data);
    } catch (e) {
      throw ServerException();
    }
  }
}
