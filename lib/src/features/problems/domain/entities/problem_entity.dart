class ProblemEntity{
  final int? id;
  final int? vehicle_id;
  final String? name;
  final int? percentage;
  final int? quantity;
  final String? created_at;

  ProblemEntity({
    required this.name,
    this.id,
    this.vehicle_id,
    this.percentage,
    this.quantity,
    this.created_at
  });

  @override
  String toString() {
    return 'ProblemEntity(id: $id, vehicle_id: $vehicle_id, name: $name, percentage: $percentage, quantity: $quantity, created_at: $created_at)';
  }
}