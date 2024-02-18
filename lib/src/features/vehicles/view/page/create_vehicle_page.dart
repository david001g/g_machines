import 'package:flutter/material.dart';
import 'package:g_machines/src/core/constants/constants.dart';
import 'package:g_machines/src/features/vehicles/view/widgets/create_vehicle_form.dart';

class CreateVehiclePage extends StatelessWidget {
  const CreateVehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(PageProperties.padding),
      child: CreateVehicleForm(),
    );
  }
}
