import 'package:equatable/equatable.dart';

class FundEntity extends Equatable {
  const FundEntity({required this.name, required this.navValue});
  final String name;
  final String navValue;

  @override
  List<Object?> get props => [name, navValue];
}
