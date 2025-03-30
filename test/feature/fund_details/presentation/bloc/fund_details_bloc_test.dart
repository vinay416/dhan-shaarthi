import 'package:dhan_saarthi/feature/fund_detail/presentation/bloc/fund_detail_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final bloc = FundDetailBloc();

  group("Fund Bloc", () {
    test("Initial State", () {
      //expect
      expect(bloc.state, InvestGraph());
    });
    test("NAV Detils event", () {
      //expect Later
      expectLater(bloc.stream, emitsInOrder([NavGraph()]));
      //act
      bloc.add(ShowNavGraph());
    });

    test("Invest Detils event", () {
      //expect Later
      expectLater(bloc.stream, emitsInOrder([InvestGraph()]));
      //act
      bloc.add(ShowInvestGraph());
    });
  });
}
