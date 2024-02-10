import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/sections/domain/entities/section.dart';
import 'package:g_machines/src/features/sections/domain/repositories/section_repository.dart';

class UpdateSection{
  final SectionRepository sectionRepository;

  UpdateSection(this.sectionRepository);

  Future<Either<Failure, bool>> call(SectionEntity section) async {
    return sectionRepository.updateSection(section);
  }
}