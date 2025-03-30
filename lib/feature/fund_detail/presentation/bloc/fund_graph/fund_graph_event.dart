part of 'fund_graph_bloc.dart';

sealed class FundGraphEvent extends Equatable {
  const FundGraphEvent();

  @override
  List<Object> get props => [];
}

final class ShowNavGraph extends FundGraphEvent {}

final class ShowInvestGraph extends FundGraphEvent {}