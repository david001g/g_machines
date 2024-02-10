import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/authentication/domain/entities/profile_entity.dart';
import 'package:g_machines/src/features/authentication/domain/repositories/profile_repository.dart';

class GetProfile{
  final ProfileRepository repository;

  GetProfile(this.repository);

  Future<Either<Failure, ProfileEntity>> call(String id) async {
    return await repository.getProfile(id);
  }
}