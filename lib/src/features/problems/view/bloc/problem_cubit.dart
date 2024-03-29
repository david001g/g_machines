import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:g_machines/src/features/authentication/domain/entities/profile_entity.dart';
import 'package:g_machines/src/features/problems/domain/entities/problem_entity.dart';
import 'package:g_machines/src/features/problems/domain/usecases/create_problem.dart';
import 'package:g_machines/src/features/problems/domain/usecases/delete_problem.dart';
import 'package:g_machines/src/features/problems/domain/usecases/get_problem.dart';
import 'package:g_machines/src/features/problems/domain/usecases/get_problems.dart';
import 'package:g_machines/src/features/problems/domain/usecases/get_problems_by_vehicle.dart';
import 'package:g_machines/src/features/problems/domain/usecases/get_profile_by_problem.dart';
import 'package:g_machines/src/features/problems/domain/usecases/update_problem.dart';

part 'problem_state.dart';

class ProblemCubit extends Cubit<ProblemState> {
  final CreateProblem createProblemUsecase;
  final DeleteProblem deleteProblemUsecase;
  final GetProblem getProblemUsecase;
  final GetProblems getProblemsUsecase;
  final GetProblemsByVehicle getProblemsByVehicleUsecase;
  final UpdateProblem updateProblemUsecase;
  final GetProfileByProblem getProfileByProblemUsecase;

  ProblemCubit(this.createProblemUsecase, this.deleteProblemUsecase, this.getProblemUsecase, this.getProblemsUsecase,
      this.getProblemsByVehicleUsecase, this.updateProblemUsecase, this.getProfileByProblemUsecase)
      : super(ProblemEmpty());

  Future<void> getProblems() async {
    emit(ProblemLoading());
    final problems = await getProblemsUsecase();
    problems.fold((failure) => emit(ProblemError(failure.message)), (problems) {
      if (problems.isEmpty) {
        emit(ProblemEmpty());
      } else {
        emit(ProblemLoaded(problems));
      }
    });
  }

  Future<void> getProblemsByVehicle(int id) async {
    emit(ProblemLoading());
    final problems = await getProblemsByVehicleUsecase(id);

    problems.fold((failure) => emit(ProblemError(failure.message)), (problems) {
      if (problems.isEmpty) {
        emit(ProblemEmpty());
      } else {
        emit(ProblemLoaded(problems));
      }
    });
  }

  Future<void> getProblem(int id) async {
    emit(ProblemLoading());
    final problem = await getProblemUsecase(id);
    problem.fold(
        (failure) => emit(ProblemError(failure.message)),
        // TODO: New state?
        (problem) => emit(ProblemLoaded([problem])));
  }

  Future<void> createProblem(ProblemEntity problem, int id) async {
    emit(ProblemLoading());
    final result = await createProblemUsecase(problem);
    result.fold((failure) => emit(ProblemError(failure.message)),
        (success) => success ? getProblemsByVehicle(id) : emit(const ProblemError('Error creating problem')));
  }

  Future<void> updateProblem(ProblemEntity problem) async {
    emit(ProblemLoading());
    final result = await updateProblemUsecase(problem);
    result.fold((failure) => emit(ProblemError(failure.message)),
        (success) => success ? getProblems() : emit(const ProblemError('Error updating problem')));
  }

  Future<void> deleteProblem(ProblemEntity problem, int id) async {
    emit(ProblemLoading());
    final result = await deleteProblemUsecase(problem);
    result.fold((failure) => emit(ProblemError(failure.message)),
        (success) => success ? getProblemsByVehicle(id) : emit(const ProblemError('Error deleting problem')));
  }


  Future<ProblemEntity> getProblemEntity(int id) async {
    final result = await getProblemUsecase(id);
    return result.fold((failure) => throw failure, (problem) => problem);
  }

  Future<ProfileEntity> getProfileByProblem(int id) async {
    final result = await getProfileByProblemUsecase(id);
    return result.fold((failure) => throw failure, (profile) => profile);
  }
}
