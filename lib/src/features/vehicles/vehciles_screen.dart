import 'package:flutter/material.dart';
import 'package:g_machines/src/features/vehicles/view/page/vehicle_page.dart';

class VehicleScreen extends StatelessWidget {
  const VehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicles'),
        centerTitle: true,
      ),
      body: const VehiclePage(),
    );
  }
}
