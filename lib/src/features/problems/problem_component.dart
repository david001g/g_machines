import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_machines/src/features/problems/domain/entities/problem_entity.dart';
import 'package:g_machines/src/features/problems/view/bloc/problem_cubit.dart';
import 'package:g_machines/src/features/problems/view/page/problem_page.dart';

class ProblemComponent extends StatelessWidget {
  final String vehicleId;

  const ProblemComponent({super.key, required this.vehicleId});

  @override
  Widget build(BuildContext context) {
    context.read<ProblemCubit>().getProblemsByVehicle(int.parse(vehicleId));

    return BlocBuilder<ProblemCubit, ProblemState>(builder: (BuildContext context, ProblemState state) {
      switch (state.runtimeType) {
        case ProblemEmpty:
          return Center(child: Text('No problems found'.tr()));
        case ProblemLoading:
          return const Center(child: CircularProgressIndicator());
        case ProblemLoaded:
          final problems = state.props[0] as List<ProblemEntity>;
          return ProblemPage(
            problems: problems,
            vehicleId: vehicleId,
          );
        case ProblemError:
          return Center(
            child: Text('Error loading problems'.tr()),
          );
        default:
          return Center(
            child: Text('Error loading problems'.tr()),
          );
      }
    });
  }
}
