import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/authentication/domain/entities/profile_entity.dart';
import 'package:g_machines/src/features/authentication/domain/repositories/profile_repository.dart';

class GetProfiles{
  final ProfileRepository repository;

  GetProfiles(this.repository);

  Future<Either<Failure, List<ProfileEntity>>> call() async {
    return await repository.getProfiles();
  }
}