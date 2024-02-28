import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/authentication/domain/entities/profile_entity.dart';
import 'package:g_machines/src/features/problems/domain/repositories/problem_repository.dart';

class GetProfileByProblem{
  final ProblemRepository repository;

  GetProfileByProblem(this.repository);

  Future<Either<Failure, ProfileEntity>> call(int id) async {
    return await repository.getProfileByProblem(id);
  }
}