import 'package:flutter/material.dart';
import 'package:g_machines/src/core/constants/constants.dart';
import 'package:g_machines/src/features/vehicles/view/widgets/create_vehicle_form.dart';

class CreateVehiclePage extends StatelessWidget {
  final String sectionId;
  const CreateVehiclePage({super.key, required this.sectionId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PageProperties.padding),
      child: CreateVehicleForm(sectionId: sectionId),
    );
  }
}
