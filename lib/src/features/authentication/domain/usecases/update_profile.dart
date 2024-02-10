import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/authentication/domain/entities/profile_entity.dart';
import 'package:g_machines/src/features/authentication/domain/repositories/profile_repository.dart';

class UpdateProfile{
  final ProfileRepository userRepository;

  UpdateProfile(this.userRepository);

  Future<Either<Failure, bool>> call(ProfileEntity profile) async {
    return userRepository.updateProfile(profile);
  }
}