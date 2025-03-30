part of 'fund_detail_bloc.dart';

sealed class FundDetailEvent extends Equatable {
  const FundDetailEvent();

  @override
  List<Object> get props => [];
}

final class NavDetails extends FundDetailEvent{}

final class InvestDetails extends FundDetailEvent{}