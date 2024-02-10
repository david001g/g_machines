class VehicleEntity{
  final int? id;
  final int? section_id;
  final String? profil_id;
  final String? name;
  final String? vehicle_type;

  VehicleEntity({
    this.id,
    this.section_id,
    this.profil_id,
    this.vehicle_type,
    required this.name,
  });

  @override
  String toString() {
    return 'VehicleEntity{id: $id, section_id: $section_id, profil_id: $profil_id, name: $name, vehicle_type: $vehicle_type}';
  }
}