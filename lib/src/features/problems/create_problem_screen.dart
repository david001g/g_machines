import 'package:flutter/material.dart';
import 'package:g_machines/src/common/my_appbar.dart';
import 'package:g_machines/src/features/problems/view/page/create_problem_page.dart';

class CreateProblemScreen extends StatelessWidget {
  final String vehicleId;

  const CreateProblemScreen({super.key, required this.vehicleId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(name: 'Create Problem', isHome: false, isProfile: false),
      body: CreateProblemPage(vehicleId: vehicleId),
    );
  }
}
