import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/report/problems/domain/entities/problem_entity.dart';

abstract class ProblemRepository {
  Future<Either<Failure, List<ProblemEntity>>> getProblems();
  Future<Either<Failure, bool>> createProblem(ProblemEntity problem);
  Future<Either<Failure, bool>> updateProblem(ProblemEntity problem);
  Future<Either<Failure, bool>> deleteProblem(int id);
  Future<Either<Failure, ProblemEntity>> getProblem(int id);
}
