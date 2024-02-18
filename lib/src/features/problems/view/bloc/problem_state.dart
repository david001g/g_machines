part of 'problem_cubit.dart';

abstract class ProblemState extends Equatable {
  const ProblemState();

  @override
  List<Object> get props => [];
}

class ProblemEmpty extends ProblemState {}
class ProblemLoading extends ProblemState {}
class ProblemLoaded extends ProblemState {
  final List<ProblemEntity> problems;

  const ProblemLoaded(this.problems);

  @override
  List<Object> get props => [problems];
}
class ProblemError extends ProblemState {
  final String message;

  const ProblemError(this.message);

  @override
  List<Object> get props => [message];
}
