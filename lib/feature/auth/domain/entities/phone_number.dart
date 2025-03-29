import 'package:equatable/equatable.dart';

/// Phone No. Object [PhoneNumber] contain [number]
class PhoneNumber extends Equatable {
  const PhoneNumber(this.number);
  final String number;

  @override
  List<Object?> get props => [number];
}
