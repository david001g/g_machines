class VehicleEntity {
  final int? id;
  final int? section_id;
  final String? profil_id;
  final String? plate_number;
  final String? vehicle_type;
  final int? problem_count;

  VehicleEntity({
    this.id,
    this.section_id,
    this.profil_id,
    required this.vehicle_type,
    required this.plate_number,
    this.problem_count,
  });

  @override
  String toString() {
    return 'VehicleEntity(id: $id, section_id: $section_id, profil_id: $profil_id, plate_number: $plate_number, vehicle_type: $vehicle_type, problem_count: $problem_count)';
  }
}
