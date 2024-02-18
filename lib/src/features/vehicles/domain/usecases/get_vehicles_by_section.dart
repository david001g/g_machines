import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/vehicles/domain/entities/vehicle_entity.dart';
import 'package:g_machines/src/features/vehicles/domain/repositories/vehicle_repository.dart';

class GetVehiclesBySection {
  final VehicleRepository repository;

  GetVehiclesBySection(this.repository);

  Future<Either<Failure, List<VehicleEntity>>> call(int id) async {
    return await repository.getVehiclesBySection(id);
  }
}