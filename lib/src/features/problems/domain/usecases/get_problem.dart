import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/problems/domain/entities/problem_entity.dart';
import 'package:g_machines/src/features/problems/domain/repositories/problem_repository.dart';

class GetProblem{
  final ProblemRepository repository;

  GetProblem(this.repository);

  Future<Either<Failure, ProblemEntity>> call(int id) async {
    return repository.getProblem(id);
  }
}