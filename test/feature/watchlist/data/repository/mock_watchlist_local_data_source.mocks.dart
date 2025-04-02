// Mocks generated by Mockito 5.4.5 from annotations
// in dhan_saarthi/test/feature/watchlist/data/repository/mock_watchlist_local_data_source.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:dhan_saarthi/feature/watchlist/domain/enities/watchlist_entity.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

import 'mock_watchlist_local_data_source.dart' as _i2;

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

/// A class which mocks [MyWatchlistLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMyWatchlistLocalDataSource extends _i1.Mock
    implements _i2.MyWatchlistLocalDataSource {
  MockMyWatchlistLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.WatchlistEntity>> getWatchlist() =>
      (super.noSuchMethod(
            Invocation.method(#getWatchlist, []),
            returnValue: _i3.Future<List<_i4.WatchlistEntity>>.value(
              <_i4.WatchlistEntity>[],
            ),
          )
          as _i3.Future<List<_i4.WatchlistEntity>>);

  @override
  _i3.Future<void> addWatchlist(_i4.WatchlistEntity? watchlist) =>
      (super.noSuchMethod(
            Invocation.method(#addWatchlist, [watchlist]),
            returnValue: _i3.Future<void>.value(),
            returnValueForMissingStub: _i3.Future<void>.value(),
          )
          as _i3.Future<void>);

  @override
  _i3.Future<void> updateWatchlist(_i4.WatchlistEntity? watchlist) =>
      (super.noSuchMethod(
            Invocation.method(#updateWatchlist, [watchlist]),
            returnValue: _i3.Future<void>.value(),
            returnValueForMissingStub: _i3.Future<void>.value(),
          )
          as _i3.Future<void>);

  @override
  _i3.Future<void> deleteWatchlist(_i4.WatchlistEntity? watchlist) =>
      (super.noSuchMethod(
            Invocation.method(#deleteWatchlist, [watchlist]),
            returnValue: _i3.Future<void>.value(),
            returnValueForMissingStub: _i3.Future<void>.value(),
          )
          as _i3.Future<void>);
}
