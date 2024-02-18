import 'package:flutter/material.dart';
import 'package:g_machines/src/core/constants/constants.dart';
import 'package:g_machines/src/features/sections/domain/entities/section.dart';
import 'package:g_machines/src/features/sections/view/widgets/section_list.dart';

class SectionPage extends StatelessWidget {
  final List<SectionEntity> sections;

  const SectionPage({super.key, required this.sections});

  @override
  Widget build(BuildContext context) {
    /// Here you can specify the layout of the page

    return Padding(
      padding: const EdgeInsets.all(PageProperties.padding),
      child: SectionList(sections: sections),
    );
  }
}
