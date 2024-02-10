import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/vehicles/domain/entities/vehicle_entity.dart';

abstract class VehicleRepository {
  Future<Either<Failure, List<VehicleEntity>>> getVehicles();
  Future<Either<Failure, bool>> createVehicle(VehicleEntity vehicle);
  Future<Either<Failure, bool>> updateVehicle(VehicleEntity vehicle);
  Future<Either<Failure, bool>> deleteVehicle(int id);
  Future<Either<Failure, VehicleEntity>> getVehicle(int id);
}