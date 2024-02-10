import 'package:flutter/material.dart';
import 'package:g_machines/src/common/item_card_primary.dart';
import 'package:g_machines/src/config/router/router.dart';
import 'package:g_machines/src/features/sections/domain/entities/section.dart';
import 'package:go_router/go_router.dart';

class SectionList extends StatelessWidget {
  final List<SectionEntity> sections;

  const SectionList({super.key, required this.sections});

  @override
  Widget build(BuildContext context) {
    return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        children: sections
            .map((section) => ItemCard(
                  title: section.section_name!,
                  icon: const Icon(Icons.directions_car),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () => context.pushNamed(AppRoutes.vehicles.name),
                ))
            .toList());
  }
}
