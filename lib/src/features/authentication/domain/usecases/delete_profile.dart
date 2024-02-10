import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/authentication/domain/repositories/profile_repository.dart';

class DeleteProfile{
  final ProfileRepository repository;

  DeleteProfile(this.repository);

  Future<Either<Failure, bool>> call(String id) async {
    return await repository.deleteProfile(id);
  }
}