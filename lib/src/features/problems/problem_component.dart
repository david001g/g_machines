import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_machines/src/features/problems/domain/entities/problem_entity.dart';
import 'package:g_machines/src/features/problems/view/bloc/problem_cubit.dart';
import 'package:g_machines/src/features/problems/view/page/problem_page.dart';
import 'package:g_machines/src/features/vehicles/domain/entities/vehicle_entity.dart';

class ProblemComponent extends StatelessWidget {
  final String vehicleId;

  const ProblemComponent({super.key, required this.vehicleId});

  @override
  Widget build(BuildContext context) {
    context.read<ProblemCubit>().getProblemsByVehicle(int.parse(vehicleId));

    return BlocBuilder<ProblemCubit, ProblemState>(builder: (BuildContext context, ProblemState state) {
      switch (state.runtimeType) {
        case ProblemEmpty:
          return const Center(child: Text('No problems found'));
        case ProblemLoading:
          return const Center(child: CircularProgressIndicator());
        case ProblemLoaded:
          final problems = state.props[0] as List<ProblemEntity>;
          return ProblemPage(
            problems: problems,
            vehicleId: vehicleId,
          );
        case ProblemError:
          return const Center(
            child: Text('Error loading problems'),
          );
        default:
          return const Center(
            child: Text('Error loading problems'),
          );
      }
    });
  }
}
