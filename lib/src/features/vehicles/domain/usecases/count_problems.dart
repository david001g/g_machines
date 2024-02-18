import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/vehicles/domain/repositories/vehicle_repository.dart';

class CountProblems{
  final VehicleRepository repository;

  CountProblems(this.repository);

  Future<Either<Failure, List<int>>> call() async {
    return await repository.countProblems();
  }
}