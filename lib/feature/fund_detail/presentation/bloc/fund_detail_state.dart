part of 'fund_detail_bloc.dart';

sealed class FundDetailState extends Equatable {
  const FundDetailState();

  @override
  List<Object> get props => [];
}

final class FundDetailsLoading extends FundDetailState {}

final class FundDetailsLoaded extends FundDetailState {
  const FundDetailsLoaded(this.fundDetails);
  final FundDetailsEntity fundDetails;

  @override
  List<Object> get props => [fundDetails];
}

final class FundDetailsError extends FundDetailState {}


