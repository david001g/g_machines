import 'package:flutter/material.dart';
import 'package:g_machines/src/common/my_appbar.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(isHome: false, name: 'Error', isProfile: true),
      body: Center(
        child: Text('Error'),
      ),
    );
  }
}
