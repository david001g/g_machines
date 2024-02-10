import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/sections/domain/repositories/section_repository.dart';

class DeleteSection{
  final SectionRepository sectionRepository;

  DeleteSection(this.sectionRepository);

  Future<Either<Failure, bool>> call(int id) async {
    return await sectionRepository.deleteSection(id);
  }
}