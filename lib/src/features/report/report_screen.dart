import 'package:flutter/material.dart';
import 'package:g_machines/src/common/my_appbar.dart';
import 'package:g_machines/src/features/report/report/view/page/report_page.dart';

class ReportScreen extends StatelessWidget {
  final String vehicleId;

  const ReportScreen({super.key, required this.vehicleId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(name: 'Report', isHome: false, isProfile: false),
      body: ReportPage(vehicleId: vehicleId),
    );
  }
}
