import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/problems/data/models/problem_model.dart';
import 'package:g_machines/src/features/problems/domain/entities/problem_entity.dart';
import 'package:g_machines/src/features/problems/domain/repositories/problem_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProblemRepositoryImpl implements ProblemRepository {
  ProblemRepositoryImpl();

  @override
  Future<Either<Failure, ProblemEntity>> getProblem(int id) async {
    try {
      final supabase = Supabase.instance.client;
      final response = await supabase.from('problems').select().eq('id', id).single();

      return Right(ProblemModel.fromJson(response).toEntity());
    } catch (e) {
      print(e);
      return const Left(SupaBaseFailure('Failed at reading problem'));
    }
  }

  @override
  Future<Either<Failure, List<ProblemEntity>>> getProblems() async {
    try {
      final supabase = Supabase.instance.client;
      final response = await supabase.from('problems').select().order('created_at', ascending: false);

      return Right(response.map((e) => ProblemModel.fromJson(e).toEntity()).toList());
    } catch (e) {
      print(e);
      return const Left(SupaBaseFailure('Failed at reading problems'));
    }
  }

  @override
  Future<Either<Failure, List<ProblemEntity>>> getProblemsByVehicle(int id) async {
    try {
      final supabase = Supabase.instance.client;
      final response = await supabase.from('problems').select().eq('vehicle_id', id).order('created_at', ascending: false);

      return Right(response.map((e) => ProblemModel.fromJson(e).toEntity()).toList());
    } catch (e) {
      print(e);
      return const Left(SupaBaseFailure('Failed at reading problems'));
    }
  }

  @override
  Future<Either<Failure, bool>> createProblem(ProblemEntity problem) async {
    try {
      final supabase = Supabase.instance.client;
      await supabase.from('problems').insert({
        'name': problem.name,
        'vehicle_id': problem.vehicle_id,
        'percentage': problem.percentage,
        'quantity': problem.quantity,
      });

      final vehicleData = await supabase.from('vehicles').select().match({'id': problem.vehicle_id}).single();
      final int vehicleProblems = vehicleData['problem_count'] as int;
      await supabase.from('vehicles').update({'problem_count': vehicleProblems + 1}).match({'id': problem.vehicle_id});

      return const Right(true);
    } catch (e) {
      print(e);
      return const Left(SupaBaseFailure('Failed at creating problem'));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteProblem(ProblemEntity problem) async {
    try {
      final supabase = Supabase.instance.client;
      await supabase.from('problems').delete().match({'id': problem.id});

      final vehicleData = await supabase.from('vehicles').select().match({'id': problem.vehicle_id}).single();
      final int vehicleProblems = vehicleData['problem_count'] as int;
      await supabase.from('vehicles').update({'problem_count': vehicleProblems - 1}).match({'id': problem.vehicle_id});

      return const Right(true);
    } catch (e) {
      print(e);
      return const Left(SupaBaseFailure('Failed at deleting problem'));
    }
  }

  @override
  Future<Either<Failure, bool>> updateProblem(ProblemEntity problem) async {
    try {
      final supabase = Supabase.instance.client;
      await supabase.from('problems').update({
        'name': problem.name,
        'vehicle_id': problem.vehicle_id,
        'percentage': problem.percentage,
        'quantity': problem.quantity,
      }).match({'id': problem.id});

      return const Right(true);
    } catch (e) {
      print(e);
      return const Left(SupaBaseFailure('Failed at updating problem'));
    }
  }
}
