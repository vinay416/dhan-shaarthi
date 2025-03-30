import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fund_detail_event.dart';
part 'fund_detail_state.dart';

class FundDetailBloc extends Bloc<FundDetailEvent, FundDetailState> {
  FundDetailBloc() : super(InvestGraph()) {
    on<FundDetailEvent>((event, emit) {
      if (event is ShowNavGraph) {
        emit(NavGraph());
      } else if (event is ShowInvestGraph) {
        emit(InvestGraph());
      }
    });
  }
}
