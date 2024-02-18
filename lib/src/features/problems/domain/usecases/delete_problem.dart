import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/problems/domain/entities/problem_entity.dart';
import 'package:g_machines/src/features/problems/domain/repositories/problem_repository.dart';

class DeleteProblem{
  final ProblemRepository repository;

  DeleteProblem(this.repository);

  Future<Either<Failure, bool>> call(ProblemEntity problem) async {
    return repository.deleteProblem(problem);
  }
}