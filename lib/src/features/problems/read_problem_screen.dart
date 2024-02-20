import 'package:flutter/material.dart';
import 'package:g_machines/src/common/my_appbar.dart';
import 'package:g_machines/src/features/problems/domain/entities/problem_entity.dart';
import 'package:g_machines/src/features/problems/view/page/read_problem_page.dart';

class ReadProblemScreen extends StatelessWidget {
  final String problemId;
  final String vehicleId;

  const ReadProblemScreen({super.key, required this.problemId, required this.vehicleId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(name: 'Problem', isHome: false, isProfile: false),
      body: ReadProblemPage(problemId: problemId, vehicleId: vehicleId),
    );
  }
}
