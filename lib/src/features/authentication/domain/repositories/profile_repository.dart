import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/authentication/domain/entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure,List<ProfileEntity>>> getProfiles();
  Future<Either<Failure, bool>> createProfile(ProfileEntity profile);
  Future<Either<Failure, bool>> updateProfile(ProfileEntity profile);
  Future<Either<Failure, bool>> deleteProfile(String id);
  Future<Either<Failure, ProfileEntity>> getProfile(String id);
}
