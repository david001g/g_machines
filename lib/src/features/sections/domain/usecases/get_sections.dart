import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/sections/domain/entities/section.dart';
import 'package:g_machines/src/features/sections/domain/repositories/section_repository.dart';

class GetSections{
  final SectionRepository repository;

  GetSections(this.repository);

  Future<Either<Failure, List<SectionEntity>>> call() async {
    return await repository.getSections();
  }
}