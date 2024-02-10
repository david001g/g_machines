import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/vehicles/domain/entities/vehicle_entity.dart';
import 'package:g_machines/src/features/vehicles/domain/repositories/vehicle_repository.dart';

class DeleteVehicle{
  final VehicleRepository repository;

  DeleteVehicle(this.repository);

  Future<Either<Failure, bool>> call(int id) async {
    return repository.deleteVehicle(id);
  }
}