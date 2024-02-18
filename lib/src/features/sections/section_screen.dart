import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_machines/src/common/my_appbar.dart';
import 'package:g_machines/src/features/sections/domain/entities/section.dart';
import 'package:g_machines/src/features/sections/view/bloc/section_cubit.dart';
import 'package:g_machines/src/features/sections/view/page/section_page.dart';
import 'package:g_machines/src/features/sections/view/widgets/section_list.dart';

class SectionScreen extends StatelessWidget {
  const SectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// READ sections
    context.read<SectionCubit>().getSections();

    return Scaffold(
      appBar: const MyAppBar(name: 'Sections', isHome: true, isProfile: false),
      body: BlocBuilder<SectionCubit, SectionState>(builder: (BuildContext context, SectionState state) {
        switch (state.runtimeType) {
          case SectionEmpty:
            return const Center(child: Text('No sections found'));
          case SectionLoading:
            return const Center(child: CircularProgressIndicator());
          case SectionLoaded:
            final sections = state.props[0] as List<SectionEntity>;
            return SectionPage(sections: sections);
          case SectionError:
            return const Center(
              child: Text('Error loading sections'),
            );
          default:
            return const Center(
              child: Text('Error loading sections'),
            );
        }
      }),
    );
  }
}
