class ProfileEntity{
  final String? id;
  final String? username;
  final String? full_name;
  final String? avatar_url;

  ProfileEntity({
    this.id,
    required this.username,
    required this.full_name,
    this.avatar_url,
  });

  @override
  String toString() {
    return 'Profile{id: $id, username: $username, full_name: $full_name, avatar_url: $avatar_url}';
  }
}