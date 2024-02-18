class ProfileEntity {
  final String? id;
  final String? full_name;
  final String? avatar_url;
  final String? phone_number;
  final bool? is_guest;
  final bool? is_admin;

  ProfileEntity({
    this.id,
    required this.full_name,
    required this.is_admin,
    required this.phone_number,
    required this.is_guest,
    this.avatar_url,
  });

  @override
  String toString() {
    return 'ProfileEntity(id: $id, full_name: $full_name, avatar_url: $avatar_url, phone_number: $phone_number, is_guest: $is_guest, is_admin: $is_admin)';
  }
}
