import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:g_machines/src/common/my_appbar.dart';
import 'package:g_machines/src/features/vehicles/view/page/vehicle_page.dart';

class VehicleScreen extends StatelessWidget {
  final String sectionId;

  const VehicleScreen({super.key, required this.sectionId});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const MyAppBar(name: 'Vehicles', isHome: false, isProfile: false),
      body: VehiclePage(sectionId: sectionId),
    );
  }
}
