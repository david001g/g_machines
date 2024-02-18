import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/sections/domain/entities/section.dart';

abstract class SectionRepository {
  Future<Either<Failure, List<SectionEntity>>> getSections();
  Future<Either<Failure, bool>> createSection(SectionEntity section);
  Future<Either<Failure, bool>> updateSection(SectionEntity section);
  Future<Either<Failure, bool>> deleteSection(int id);
  Future<Either<Failure, SectionEntity>> getSection(int id);
  Future<Either<Failure, int>> countVehicles(int id);
}
