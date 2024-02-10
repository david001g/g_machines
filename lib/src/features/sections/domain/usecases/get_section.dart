import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/sections/domain/entities/section.dart';
import 'package:g_machines/src/features/sections/domain/repositories/section_repository.dart';

class GetSection{
  final SectionRepository sectionRepository;

  GetSection(this.sectionRepository);

  Future<Either<Failure, SectionEntity>> call(int id) async {
    return await sectionRepository.getSection(id);
  }
}