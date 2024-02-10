import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:g_machines/src/features/sections/domain/entities/section.dart';
import 'package:g_machines/src/features/sections/domain/usecases/create_section.dart';
import 'package:g_machines/src/features/sections/domain/usecases/delete_section.dart';
import 'package:g_machines/src/features/sections/domain/usecases/get_section.dart';
import 'package:g_machines/src/features/sections/domain/usecases/get_sections.dart';
import 'package:g_machines/src/features/sections/domain/usecases/update_section.dart';

part 'section_state.dart';

class SectionCubit extends Cubit<SectionState> {

  final CreateSection createSectionUsecase;
  final GetSections getSectionsUsecase;
  final GetSection getSectionUsecase;
  final DeleteSection deleteSectionUsecase;
  final UpdateSection updateSectionUsecase;

  SectionCubit(this.createSectionUsecase, this.getSectionsUsecase, this.getSectionUsecase, this.deleteSectionUsecase, this.updateSectionUsecase) : super(SectionEmpty());

  void getSections() async {
    emit(SectionLoading());
    final result = await getSectionsUsecase.call();
    result.fold(
      (l) => emit(SectionError(message: l.message)),
      (r) => emit(SectionLoaded(sections: r)),
    );
  }


}
