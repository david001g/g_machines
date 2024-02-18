import 'package:flutter/material.dart';
import 'package:g_machines/src/common/my_appbar.dart';
import 'package:g_machines/src/features/vehicles/view/page/create_vehicle_page.dart';

class CreateVehicleScreen extends StatelessWidget {
  const CreateVehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(name: 'Create Vehicle', isHome: false, isProfile: false),
      body: CreateVehiclePage(),
    );
  }
}
