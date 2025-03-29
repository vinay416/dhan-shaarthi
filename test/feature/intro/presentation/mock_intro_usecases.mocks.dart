// Mocks generated by Mockito 5.4.5 from annotations
// in dhan_saarthi/test/feature/intro/presentation/mock_intro_usecases.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:dhan_saarthi/core/failure.dart' as _i6;
import 'package:dhan_saarthi/feature/intro/domain/repository/intro_repository.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

import 'mock_intro_usecases.dart' as _i4;

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

class _FakeIntroRepository_0 extends _i1.SmartFake
    implements _i2.IntroRepository {
  _FakeIntroRepository_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [GetIntro].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetIntro extends _i1.Mock implements _i4.GetIntro {
  MockGetIntro() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IntroRepository get repository =>
      (super.noSuchMethod(
            Invocation.getter(#repository),
            returnValue: _FakeIntroRepository_0(
              this,
              Invocation.getter(#repository),
            ),
          )
          as _i2.IntroRepository);

  @override
  bool get isCompleted =>
      (super.noSuchMethod(Invocation.getter(#isCompleted), returnValue: false)
          as bool);
}

/// A class which mocks [SetIntro].
///
/// See the documentation for Mockito's code generation for more information.
class MockSetIntro extends _i1.Mock implements _i4.SetIntro {
  MockSetIntro() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IntroRepository get repository =>
      (super.noSuchMethod(
            Invocation.getter(#repository),
            returnValue: _FakeIntroRepository_0(
              this,
              Invocation.getter(#repository),
            ),
          )
          as _i2.IntroRepository);

  @override
  _i5.Future<_i3.Either<_i6.Failure, _i3.Unit>> call() =>
      (super.noSuchMethod(
            Invocation.method(#call, []),
            returnValue: _i5.Future<_i3.Either<_i6.Failure, _i3.Unit>>.value(
              _FakeEither_1<_i6.Failure, _i3.Unit>(
                this,
                Invocation.method(#call, []),
              ),
            ),
          )
          as _i5.Future<_i3.Either<_i6.Failure, _i3.Unit>>);
}
