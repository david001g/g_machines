import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/problems/domain/entities/problem_entity.dart';
import 'package:g_machines/src/features/problems/domain/repositories/problem_repository.dart';

class GetProblems{
  final ProblemRepository problemsRepository;

  GetProblems(this.problemsRepository);

  Future<Either<Failure, List<ProblemEntity>>> call() async {
    return await problemsRepository.getProblems();
  }
}