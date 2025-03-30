part of 'fund_detail_bloc.dart';

sealed class FundDetailState extends Equatable {
  const FundDetailState();

  @override
  List<Object> get props => [];
}

final class FundNAV extends FundDetailState {}

final class FundInvest extends FundDetailState {}
