import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/authentication/data/models/profile_model.dart';
import 'package:g_machines/src/features/authentication/domain/entities/profile_entity.dart';
import 'package:g_machines/src/features/authentication/domain/repositories/profile_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl();

  @override
  Future<Either<Failure, bool>> createProfile(ProfileEntity profile) async {
    try {
      final supabase = Supabase.instance.client;
      await supabase.from('profiles').insert({
        'username': profile.username,
        'full_name': profile.full_name,
        'avatar_url': profile.avatar_url,
      });

      return const Right(true);
    } catch (e) {
      print(e);
      return const Left(SupaBaseFailure('Failed at creating profile'));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteProfile(String id) async {
    try {
      final supabase = Supabase.instance.client;
      supabase.from('profiles').delete().match({'id': id});

      return const Right(true);
    } catch (e) {
      print(e);
      return const Left(SupaBaseFailure('Failed at deleting profile'));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> getProfile(String id) async {
    try {
      final supabase = Supabase.instance.client;
      final response = await supabase.from('profiles').select().eq('id', id).single();

      return Right(ProfileModel.fromJson(response).toEntity());
    } catch (e) {
      print(e);
      return const Left(SupaBaseFailure('Failed at reading profile'));
    }
  }

  @override
  Future<Either<Failure, List<ProfileEntity>>> getProfiles() async {
    try {
      final supabase = Supabase.instance.client;
      final response = await supabase.from('profiles').select();

      return Right(response.map((e) => ProfileModel.fromJson(e).toEntity()).toList());
    } catch (e) {
      print(e);
      return const Left(SupaBaseFailure('Failed at reading profiles'));
    }
  }

  @override
  Future<Either<Failure, bool>> updateProfile(ProfileEntity profile) async {
    try {
      final supabase = Supabase.instance.client;
      await supabase.from('profiles').update({
        'id': profile.id,
        'username': profile.username,
        'full_name': profile.full_name,
        'avatar_url': profile.avatar_url,
      }).match({'id': profile.id});

      return const Right(true);
    } catch (e) {
      print(e);
      return const Left(SupaBaseFailure('Failed at updating profile'));
    }
  }
}
