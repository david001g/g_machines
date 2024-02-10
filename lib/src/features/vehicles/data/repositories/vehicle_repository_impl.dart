import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/vehicles/data/models/vehicle_model.dart';
import 'package:g_machines/src/features/vehicles/domain/entities/vehicle_entity.dart';
import 'package:g_machines/src/features/vehicles/domain/repositories/vehicle_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class VehicleRepositoryImpl implements VehicleRepository {
  VehicleRepositoryImpl();

  @override
  Future<Either<Failure, List<VehicleEntity>>> getVehicles() async {
    try {
      final supabase = Supabase.instance.client;
      final response = await supabase.from('vehicles').select();

      return Right(response.map((e) => VehicleModel.fromJson(e).toEntity()).toList());
    } catch (e) {
      print(e);
      return const Left(SupaBaseFailure('Failed at reading vehicles'));
    }
  }

  @override
  Future<Either<Failure, bool>> createVehicle(VehicleEntity vehicle) async {
    try {
      final supabase = Supabase.instance.client;
      await supabase.from('vehicles').insert({
        'name': vehicle.name,
        'vehicle_type': vehicle.vehicle_type,
        'section_id': vehicle.section_id,
        'profil_id': vehicle.profil_id
      });

      return const Right(true);
    } catch (e) {
      print(e);
      return const Left(SupaBaseFailure('Failed at creating vehicle'));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteVehicle(int id) async {
    try {
      final supabase = Supabase.instance.client;
      await supabase.from('vehicles').delete().match({'id': id});

      return const Right(true);
    } catch (e) {
      print(e);
      return const Left(SupaBaseFailure('Failed at deleting vehicle'));
    }
  }

  @override
  Future<Either<Failure, VehicleEntity>> getVehicle(int id) async {
    try{
      final supabase = Supabase.instance.client;
      final response = await supabase.from('vehicles').select().eq('id', id).single();

      return Right(VehicleModel.fromJson(response).toEntity());
    } catch (e) {
      print(e);
      return const Left(SupaBaseFailure('Failed at reading vehicle'));
    }
  }

  @override
  Future<Either<Failure, bool>> updateVehicle(VehicleEntity vehicle) async {
    try {
      final supabase = Supabase.instance.client;
      await supabase.from('vehicles').update({
        'name': vehicle.name,
        'vehicle_type': vehicle.vehicle_type,
        'section_id': vehicle.section_id,
        'profil_id': vehicle.profil_id
      }).match({'id': vehicle.id});

      return const Right(true);
    } catch (e) {
      print(e);
      return const Left(SupaBaseFailure('Failed at updating vehicle'));
    }
  }
}
