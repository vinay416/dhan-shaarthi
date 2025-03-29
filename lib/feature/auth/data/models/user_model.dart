import 'package:dhan_saarthi/feature/auth/domain/entities/user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserModel extends UserEntity {
  const UserModel({required super.id, required super.phoneNo});

  factory UserModel.fromUser(User user){
    return UserModel(id: user.id, phoneNo: user.phone ?? "");
  }
}
