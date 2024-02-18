import 'package:flutter/material.dart';
import 'package:g_machines/src/core/constants/constants.dart';
import 'package:g_machines/src/features/problems/view/widgets/create_problem_form.dart';
import 'package:g_machines/src/features/vehicles/domain/entities/vehicle_entity.dart';

class CreateProblemPage extends StatelessWidget {
  final String vehicleId;

  const CreateProblemPage({super.key, required this.vehicleId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PageProperties.padding),
      child: CreateProblemForm(vehicleId: vehicleId),
    );
  }
}
