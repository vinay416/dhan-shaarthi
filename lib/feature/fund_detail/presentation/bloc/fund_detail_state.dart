part of 'fund_detail_bloc.dart';

sealed class FundDetailState extends Equatable {
  const FundDetailState();

  @override
  List<Object> get props => [];
}

final class NavGraph extends FundDetailState {}

final class InvestGraph extends FundDetailState {}
