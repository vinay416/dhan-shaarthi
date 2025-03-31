import 'package:equatable/equatable.dart';

class FundEntity extends Equatable {
  const FundEntity({required this.id, required this.navValue});
  final String id;
  final String navValue;

  @override
  List<Object?> get props => [id, navValue];
}
