// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

/// User Object [UserEntity] contain [id] and [phoneNo]
class UserEntity extends Equatable {
  final String id;
  final String phoneNo;
  const UserEntity({required this.id, required this.phoneNo});

  @override
  List<Object?> get props => [id, phoneNo];
}
