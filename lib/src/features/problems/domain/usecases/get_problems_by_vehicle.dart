import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/problems/domain/entities/problem_entity.dart';
import 'package:g_machines/src/features/problems/domain/repositories/problem_repository.dart';

class GetProblemsByVehicle {
  final ProblemRepository _problemsRepository;

  GetProblemsByVehicle(this._problemsRepository);

  Future<Either<Failure, List<ProblemEntity>>> call(int id) async {
    return await _problemsRepository.getProblemsByVehicle(id);
  }
}
