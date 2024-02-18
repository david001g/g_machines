import 'package:dartz/dartz.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/sections/domain/repositories/section_repository.dart';

class CountVehicles {
  final SectionRepository sectionRepository;

  CountVehicles(this.sectionRepository);

  Future<Either<Failure, int>> call(int id) async {
    return sectionRepository.countVehicles(id);
  }
}
