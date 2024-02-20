import 'package:flutter/material.dart';
import 'package:g_machines/src/features/problems/domain/entities/problem_entity.dart';
import 'package:g_machines/src/features/problems/view/widgets/problem_list.dart';

class ProblemPage extends StatelessWidget {
  final List<ProblemEntity> problems;
  final String vehicleId;

  const ProblemPage({super.key, required this.problems, required this.vehicleId});

  @override
  Widget build(BuildContext context) {
    return ProblemList(problems: problems, vehicleId: vehicleId);
  }
}
