import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/authentication/domain/entities/profile_entity.dart';
import 'package:g_machines/src/features/authentication/domain/repositories/profile_repository.dart';

class CreateProfile{
  final ProfileRepository repository;

  CreateProfile(this.repository);

  Future<Either<Failure, bool>> call(ProfileEntity profile) async {
    return await repository.createProfile(profile);
  }
}