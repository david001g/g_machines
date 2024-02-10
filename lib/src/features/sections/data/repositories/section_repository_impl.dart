import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/sections/data/models/section_model.dart';
import 'package:g_machines/src/features/sections/domain/entities/section.dart';
import 'package:g_machines/src/features/sections/domain/repositories/section_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SectionRepositoryImpl implements SectionRepository{
  SectionRepositoryImpl();

  @override
  Future<Either<Failure, bool>> createSection(SectionEntity section) async{
    try {
      final supabase = Supabase.instance.client;
      await supabase.from('sections').insert({
        'section_name': section.section_name,
        'section_number': section.section_number,
      });

      return const Right(true);
    }
    catch(e){
      print(e);
      return const Left(SupaBaseFailure('Failed at creating section'));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteSection(int id) async{
    try {
      final supabase = Supabase.instance.client;
      await supabase.from('sections').delete().match({'id': id});

      return const Right(true);
    }
    catch(e){
      print(e);
      return const Left(SupaBaseFailure('Failed at deleting section'));
    }
  }

  @override
  Future<Either<Failure, SectionEntity>> getSection(int id) async{
    try{
      final supabase = Supabase.instance.client;
      final response = await supabase.from('sections').select().eq('id', id).single();

      return Right(SectionModel.fromJson(response).toEntity());
    }
    catch(e){
      print(e);
      return const Left(SupaBaseFailure('Failed at reading section'));
    }
  }

  @override
  Future<Either<Failure, List<SectionEntity>>> getSections() async{
    try {
      final supabase = Supabase.instance.client;
      final response = await supabase.from('sections').select();

      return Right(response.map((e) => SectionModel.fromJson(e).toEntity()).toList());
    }
    catch(e){
      print(e);
      return const Left(SupaBaseFailure('Failed at reading sections'));
    }
  }

  @override
  Future<Either<Failure, bool>> updateSection(SectionEntity section) async{
    try {
      final supabase = Supabase.instance.client;
      await supabase.from('sections').update({
        'section_name': section.section_name,
        'section_number': section.section_number
      }).match({'id': section.id});

      return const Right(true);
    }
    catch(e){
      print(e);
      return const Left(SupaBaseFailure('Failed at updating section'));
    }
  }

}