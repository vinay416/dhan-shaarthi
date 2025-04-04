// Mocks generated by Mockito 5.4.5 from annotations
// in dhan_saarthi/test/feature/fund_details/data/repository/mock_fund_remote_source.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:dhan_saarthi/feature/fund_detail/data/models/fund_invest_details_model.dart'
    as _i3;
import 'package:dhan_saarthi/feature/fund_detail/data/models/fund_performace_model.dart'
    as _i4;
import 'package:dhan_saarthi/feature/fund_detail/data/models/nav_details_model.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

import 'mock_fund_remote_source.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeNavDetailsModel_0 extends _i1.SmartFake
    implements _i2.NavDetailsModel {
  _FakeNavDetailsModel_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeFundInvestDetailsModel_1 extends _i1.SmartFake
    implements _i3.FundInvestDetailsModel {
  _FakeFundInvestDetailsModel_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeFundPerformaceModel_2 extends _i1.SmartFake
    implements _i4.FundPerformaceModel {
  _FakeFundPerformaceModel_2(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [FundRemoteSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockFundRemoteSource extends _i1.Mock implements _i5.FundRemoteSource {
  MockFundRemoteSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.NavDetailsModel> getNavDetails() =>
      (super.noSuchMethod(
            Invocation.method(#getNavDetails, []),
            returnValue: _i6.Future<_i2.NavDetailsModel>.value(
              _FakeNavDetailsModel_0(
                this,
                Invocation.method(#getNavDetails, []),
              ),
            ),
          )
          as _i6.Future<_i2.NavDetailsModel>);

  @override
  _i6.Future<_i3.FundInvestDetailsModel> getFundInvestDetails() =>
      (super.noSuchMethod(
            Invocation.method(#getFundInvestDetails, []),
            returnValue: _i6.Future<_i3.FundInvestDetailsModel>.value(
              _FakeFundInvestDetailsModel_1(
                this,
                Invocation.method(#getFundInvestDetails, []),
              ),
            ),
          )
          as _i6.Future<_i3.FundInvestDetailsModel>);

  @override
  _i6.Future<_i4.FundPerformaceModel> getFundPerformaceDetails() =>
      (super.noSuchMethod(
            Invocation.method(#getFundPerformaceDetails, []),
            returnValue: _i6.Future<_i4.FundPerformaceModel>.value(
              _FakeFundPerformaceModel_2(
                this,
                Invocation.method(#getFundPerformaceDetails, []),
              ),
            ),
          )
          as _i6.Future<_i4.FundPerformaceModel>);
}
