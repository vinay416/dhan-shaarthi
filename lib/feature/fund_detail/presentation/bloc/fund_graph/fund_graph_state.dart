part of 'fund_graph_bloc.dart';

sealed class FundGraphState extends Equatable {
  const FundGraphState();
  
  @override
  List<Object> get props => [];
}

final class NavGraph extends FundGraphState {}

final class InvestGraph extends FundGraphState {}
