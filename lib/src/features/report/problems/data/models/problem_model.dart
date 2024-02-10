import 'package:g_machines/src/features/report/problems/domain/entities/problem_entity.dart';

class ProblemModel extends ProblemEntity{
  ProblemModel({
    required String name,
    int? id,
    int? vehicle_id,
    int? percentage,
    int? quantity,
  }) : super(
    name: name,
    id: id,
    vehicle_id: vehicle_id,
    percentage: percentage,
    quantity: quantity,
  );

  factory ProblemModel.fromJson(Map<String, dynamic> json) {
    return ProblemModel(
      id: json['id'],
      vehicle_id: json['vehicle_id'],
      name: json['name'],
      percentage: json['percentage'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'vehicle_id': vehicle_id,
      'name': name,
      'percentage': percentage,
      'quantity': quantity,
    };
  }

  ProblemEntity toEntity() {
    return ProblemEntity(
      id: id,
      vehicle_id: vehicle_id,
      name: name,
      percentage: percentage,
      quantity: quantity,
    );
  }
}