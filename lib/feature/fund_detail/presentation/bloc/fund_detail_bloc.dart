import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/enitiies/fund_details_entity.dart';
import '../../domain/usecase/get_fund_details.dart';

part 'fund_detail_event.dart';
part 'fund_detail_state.dart';

class FundDetailBloc extends Bloc<FundDetailEvent, FundDetailState> {
  final GetFundDetails getFundDetails;
  FundDetailBloc({required this.getFundDetails}) : super(FundDetailsLoading()) {
    on<InitFundDetail>(_onFetchInit);
  }

  FutureOr<void> _onFetchInit(InitFundDetail event, emit) async {
    final response = await getFundDetails.call();
    final state = response.fold(
      (failure) => FundDetailsError(),
      (fundDetails) => FundDetailsLoaded(fundDetails),
    );
    emit(state);
  }
}
