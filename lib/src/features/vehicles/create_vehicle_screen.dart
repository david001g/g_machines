import 'package:flutter/material.dart';
import 'package:g_machines/src/common/my_appbar.dart';
import 'package:g_machines/src/features/vehicles/view/page/create_vehicle_page.dart';

class CreateVehicleScreen extends StatelessWidget {
  final String sectionId;
  const CreateVehicleScreen({super.key, required this.sectionId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(name: 'Create Vehicle', isHome: false, isProfile: false),
      body: CreateVehiclePage(sectionId: sectionId,),
    );
  }
}
