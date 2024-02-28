import 'package:g_machines/src/features/problems/domain/entities/problem_entity.dart';

class ProblemModel extends ProblemEntity {
  ProblemModel({
    required String name,
    required String profile_id,
    int? id,
    int? vehicle_id,
    int? percentage,
    int? quantity,
    String? created_at,
  }) : super(
          name: name,
          profile_id: profile_id,
          id: id,
          vehicle_id: vehicle_id,
          percentage: percentage,
          quantity: quantity,
          created_at: created_at,
        );

  factory ProblemModel.fromJson(Map<String, dynamic> json) {
    return ProblemModel(
      id: json['id'],
      profile_id: json['profile_id'],
      vehicle_id: json['vehicle_id'],
      name: json['name'],
      percentage: json['percentage'],
      quantity: json['quantity'],
      created_at: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'profile_id': profile_id,
      'vehicle_id': vehicle_id,
      'name': name,
      'percentage': percentage,
      'quantity': quantity,
      'created_at': created_at,
    };
  }

  ProblemEntity toEntity() {
    return ProblemEntity(
      id: id,
      profile_id: profile_id,
      vehicle_id: vehicle_id,
      name: name,
      percentage: percentage,
      quantity: quantity,
      created_at: created_at,
    );
  }
}
