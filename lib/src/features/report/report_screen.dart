import 'package:flutter/material.dart';
import 'package:g_machines/src/common/item_card_primary.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ItemCard(
            title: "Header",
            icon: const Icon(Icons.accessible_forward_rounded),
            onTap: (){},
            trailing: trailing,
          ),
          const Text('Details screen'),
        ],
      ),
    );
  }
}
