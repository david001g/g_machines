import 'package:device_preview/device_preview.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:g_machines/src/config/router/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: DevicePreview.locale(context),
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(
        scheme: FlexScheme.blueM3,
        useMaterial3: true,

      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.blueM3,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.light,
      restorationScopeId: 'app',
    );
  }
}
