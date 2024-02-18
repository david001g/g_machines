import 'package:g_machines/src/features/vehicles/domain/entities/vehicle_entity.dart';

class VehicleModel {
  final int? id;
  final int? section_id;
  final String? profil_id;
  final String? vehicle_type;
  final String? plate_number;
  final int? problem_count;

  VehicleModel({
    this.id,
    this.section_id,
    this.profil_id,
    required this.vehicle_type,
    required this.plate_number,
    this.problem_count,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['id'] as int?,
      section_id: json['section_id'] as int?,
      profil_id: json['profil_id'] as String?,
      vehicle_type: json['vehicle_type'] as String?,
      plate_number: json['plate_number'] as String?,
      problem_count: json['problem_count'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'section_id': section_id,
      'profil_id': profil_id,
      'vehicle_type': vehicle_type,
      'plate_number': plate_number,
      'problem_count': problem_count,
    };
  }

  VehicleEntity toEntity() {
    return VehicleEntity(
      id: id,
      section_id: section_id,
      profil_id: profil_id,
      vehicle_type: vehicle_type,
      plate_number: plate_number,
      problem_count: problem_count,
    );
  }
}
