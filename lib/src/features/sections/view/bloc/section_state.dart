part of 'section_cubit.dart';

abstract class SectionState extends Equatable {
  const SectionState();

  @override
  List<Object> get props => [];
}

class SectionEmpty extends SectionState {}

class SectionLoading extends SectionState {}

class SectionLoaded extends SectionState {
  final List<SectionEntity> sections;

  const SectionLoaded({required this.sections});

  @override
  List<Object> get props => [sections];
}

class SectionError extends SectionState {
  final String message;

  const SectionError({required this.message});

  @override
  List<Object> get props => [message];
}
