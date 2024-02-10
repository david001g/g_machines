import 'package:g_machines/src/features/vehicles/domain/entities/vehicle_entity.dart';

class VehicleModel {
  final int? id;
  final int? section_id;
  final String? profil_id;
  final String? name;
  final String? vehicle_type;

  VehicleModel({
    this.id,
    this.section_id,
    this.profil_id,
    this.vehicle_type,
    required this.name,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['id'] as int?,
      section_id: json['section_id'] as int?,
      profil_id: json['profil_id'] as String?,
      name: json['name'] as String?,
      vehicle_type: json['vehicle_type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'section_id': section_id,
      'profil_id': profil_id,
      'name': name,
      'vehicle_type': vehicle_type,
    };
  }

  VehicleEntity toEntity() {
    return VehicleEntity(
      id: id,
      section_id: section_id,
      profil_id: profil_id,
      name: name,
      vehicle_type: vehicle_type,
    );
  }
}
