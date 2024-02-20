import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_machines/src/app.dart';
import 'package:g_machines/src/core/constants/constants.dart';
import 'package:g_machines/src/features/authentication/view/bloc/authentication_cubit.dart';
import 'package:g_machines/src/features/problems/view/bloc/problem_cubit.dart';
import 'package:g_machines/src/features/sections/view/bloc/section_cubit.dart';
import 'package:g_machines/injection_container.dart';
import 'package:g_machines/src/features/vehicles/view/bloc/vehicle_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await Supabase.initialize(
    url: Urls.supabaseUrl,
    anonKey: Urls.supabaseKey,
  );
  await EasyLocalization.ensureInitialized();
  //EasyLocalization.logger.enableBuildModes = [];

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(DevicePreview(
        enabled: false,
        builder: (BuildContext context) => EasyLocalization(
            supportedLocales: const [Locale('en', 'US'), Locale('hu', 'HU'), Locale('zh', 'CN')],
            path: 'assets/translations',
            fallbackLocale: const Locale('en', 'US'),
            useOnlyLangCode: false,
            child: const MainApp()),
      )));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => sl<SectionCubit>()),
      BlocProvider(create: (context) => sl<VehicleCubit>()),
      BlocProvider(create: (context) => sl<ProblemCubit>()),
      BlocProvider(create: (context) => sl<AuthenticationCubit>()),
    ], child: const MyApp());
  }
}
