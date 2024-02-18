import 'package:g_machines/src/features/authentication/domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity{
  ProfileModel({
    required String? full_name,
    required bool? is_admin,
    required String? phone_number,
    required bool? is_guest,
    String? id,
    String? avatar_url,
}) : super(
    full_name: full_name,
    is_admin: is_admin,
    phone_number: phone_number,
    is_guest: is_guest,
    id: id,
    avatar_url: avatar_url,
  );

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      full_name: json['full_name'],
      is_admin: json['is_admin'],
      phone_number: json['phone_number'],
      is_guest: json['is_guest'],
      id: json['id'],
      avatar_url: json['avatar_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'full_name': full_name,
      'is_admin': is_admin,
      'phone_number': phone_number,
      'is_guest': is_guest,
      'id': id,
      'avatar_url': avatar_url,
    };
  }

  ProfileEntity toEntity(){
    return ProfileEntity(
      full_name: full_name,
      is_admin: is_admin,
      phone_number: phone_number,
      is_guest: is_guest,
      id: id,
      avatar_url: avatar_url,
    );
  }

}