import 'package:equatable/equatable.dart';

/// Phone No. Object [PhoneNumber] contain [number]
class PhoneNumber extends Equatable {
  const PhoneNumber(this.number, {this.countryCode = "+91"});
  final String number;
  final String countryCode;

  @override
  List<Object?> get props => [number, countryCode];
}
