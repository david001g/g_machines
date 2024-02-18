import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_machines/src/app.dart';
import 'package:g_machines/src/core/constants/constants.dart';
import 'package:g_machines/src/features/authentication/view/bloc/authentication_cubit.dart';
import 'package:g_machines/src/features/problems/view/bloc/problem_cubit.dart';
import 'package:g_machines/src/features/sections/data/repositories/section_repository_impl.dart';
import 'package:g_machines/src/features/sections/domain/entities/section.dart';
import 'package:g_machines/src/features/sections/view/bloc/section_cubit.dart';
import 'package:g_machines/src/features/vehicles/data/repositories/vehicle_repository_impl.dart';
import 'package:g_machines/src/features/vehicles/domain/entities/vehicle_entity.dart';
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

  //SectionRepositoryImpl sectionRepositoryImpl = SectionRepositoryImpl();

  //final response = await sectionRepositoryImpl.deleteSection(2);

  //response.fold((l) => print(l.message), (r) => print(r));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MainApp(),
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
