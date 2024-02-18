import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:g_machines/src/features/authentication/domain/entities/profile_entity.dart';
import 'package:g_machines/src/features/authentication/domain/usecases/create_profile.dart';
import 'package:g_machines/src/features/authentication/domain/usecases/delete_profile.dart';
import 'package:g_machines/src/features/authentication/domain/usecases/get_profile.dart';
import 'package:g_machines/src/features/authentication/domain/usecases/get_profiles.dart';
import 'package:g_machines/src/features/authentication/domain/usecases/update_profile.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final GetProfile getProfileUsecase;
  final GetProfiles getProfilesUsecase;
  final UpdateProfile updateProfileUsecase;
  final DeleteProfile deleteProfileUsecase;
  final CreateProfile createProfileUsecase;

  late bool? isAdmin;
  late ProfileEntity? profile;

  AuthenticationCubit(this.getProfileUsecase, this.getProfilesUsecase, this.updateProfileUsecase, this.deleteProfileUsecase, this.createProfileUsecase) : super(AuthenticationEmpty());

  Future<void> getProfile(String id)async{
    emit (AuthenticationLoading());
    final result = await getProfileUsecase(id);
    result.fold(
      (l) => emit(AuthenticationError(l.toString())),
      (r) {
        isAdmin = r.is_admin;
        profile = r;
        emit(UserAuthenticated(r));
      }
    );
  }

  Future<ProfileEntity> getProfileEntity(String id)async{
    final result = await getProfileUsecase(id);
    return result.fold(
      (l) => throw l,
      (r) => r
    );
  }
}
