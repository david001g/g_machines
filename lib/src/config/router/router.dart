import 'package:g_machines/src/features/authentication/auth_screen.dart';
import 'package:g_machines/src/features/report/report_screen.dart';
import 'package:g_machines/src/features/sections/section_screen.dart';
import 'package:g_machines/src/features/vehicles/vehciles_screen.dart';
import 'package:go_router/go_router.dart';

enum AppRoutes { home, vehicles, details, auth }

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoutes.auth.name,
      builder: (context, state) => const ReportScreen(),
      routes: [
        GoRoute(
          path: 'home',
          name: AppRoutes.home.name,
          builder: (context, state) => const SectionScreen(),
        ),
        GoRoute(
          path: 'vehicles',
          name: AppRoutes.vehicles.name,
          builder: (context, state) => const VehicleScreen(),
        ),
        GoRoute(
          path: 'details',
          name: AppRoutes.details.name,
          builder: (context, state) => const ReportScreen(),
        ),
      ],
    ),
  ],
);
