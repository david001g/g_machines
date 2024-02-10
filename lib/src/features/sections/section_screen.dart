import 'package:flutter/material.dart';
import 'package:g_machines/src/features/sections/view/page/section_page.dart';

class SectionScreen extends StatelessWidget {
  const SectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sections'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: const SectionPage(),
    );
  }
}
