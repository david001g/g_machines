import 'package:g_machines/src/features/authentication/domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity{
  ProfileModel({
    required String? username,
    required String? full_name,
    String? id,
    String? avatar_url,
}) : super(
    username: username,
    full_name: full_name,
    id: id,
    avatar_url: avatar_url,
  );

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      username: json['username'],
      full_name: json['full_name'],
      id: json['id'],
      avatar_url: json['avatar_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'full_name': full_name,
      'id': id,
      'avatar_url': avatar_url,
    };
  }

  ProfileEntity toEntity(){
    return ProfileEntity(
      username: username,
      full_name: full_name,
      id: id,
      avatar_url: avatar_url,
    );
  }

}