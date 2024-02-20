import 'package:flutter/material.dart';
import 'package:g_machines/src/core/constants/constants.dart';
import 'package:g_machines/src/features/problems/domain/entities/problem_entity.dart';
import 'package:g_machines/src/features/problems/view/widgets/read_problem_form.dart';

class ReadProblemPage extends StatelessWidget {
  final String problemId;
  final String vehicleId;

  const ReadProblemPage({super.key, required this.problemId, required this.vehicleId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PageProperties.padding),
      child: ReadProblemForm(problemId: problemId, vehicleId: vehicleId),
    );
  }
}
