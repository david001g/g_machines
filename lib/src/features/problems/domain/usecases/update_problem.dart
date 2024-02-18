import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/problems/domain/entities/problem_entity.dart';
import 'package:g_machines/src/features/problems/domain/repositories/problem_repository.dart';

class UpdateProblem{
  final ProblemRepository repository;

  UpdateProblem(this.repository);

  Future<Either<Failure, bool>> call(ProblemEntity problem) async {
    return repository.updateProblem(problem);
  }
}