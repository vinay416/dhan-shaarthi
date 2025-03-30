import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fund_graph_event.dart';
part 'fund_graph_state.dart';

class FundGraphBloc extends Bloc<FundGraphEvent, FundGraphState> {
  FundGraphBloc() : super(NavGraph()) {
    on<ShowNavGraph>((event, emit) => emit(NavGraph()));
    on<ShowInvestGraph>((event, emit) => emit(InvestGraph()));
  }
}
