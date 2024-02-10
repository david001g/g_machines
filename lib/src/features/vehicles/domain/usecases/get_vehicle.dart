import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/vehicles/domain/entities/vehicle_entity.dart';
import 'package:g_machines/src/features/vehicles/domain/repositories/vehicle_repository.dart';

class GetVehicle{
  final VehicleRepository repository;

  GetVehicle(this.repository);

  Future<Either<Failure, VehicleEntity>> call(int id) async {
    return repository.getVehicle(id);
  }
}