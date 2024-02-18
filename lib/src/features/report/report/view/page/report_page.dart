import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_machines/src/config/router/router.dart';
import 'package:g_machines/src/core/constants/constants.dart';
import 'package:g_machines/src/features/authentication/domain/entities/profile_entity.dart';
import 'package:g_machines/src/features/authentication/view/bloc/authentication_cubit.dart';
import 'package:g_machines/src/features/problems/problem_component.dart';
import 'package:g_machines/src/features/report/report/view/widgets/header_card.dart';
import 'package:g_machines/src/features/report/report/view/widgets/section_title.dart';
import 'package:go_router/go_router.dart';

class ReportPage extends StatelessWidget {
  final String vehicleId;

  const ReportPage({super.key, required this.vehicleId});

  @override
  Widget build(BuildContext context) {
    /// Get user
    final isAdmin = context.read<AuthenticationCubit>().isAdmin!;

    return Padding(
      padding: const EdgeInsets.all(PageProperties.padding),
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          HeaderCard(vehicleId: vehicleId,),
          SectionTitle(
              title: 'Problems',
              trailing: isAdmin
                  ? null
                  : ElevatedButton.icon(
                      onPressed: () => context.pushNamed(AppRoutes.createProblem.name, queryParameters: {'vehicleId': vehicleId}),
                      icon: const Icon(Icons.add),
                      label: Text("Add".tr()))),
          ProblemComponent(vehicleId: vehicleId),
          //const SectionTitle(title: 'At Section 1'),
          //const MyMap(),
        ],
      ),
    );
  }
}
