import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_machines/src/common/error_page.dart';
import 'package:g_machines/src/common/loading_page.dart';
import 'package:g_machines/src/common/no_profile.dart';
import 'package:g_machines/src/features/authentication/auth_screen.dart';
import 'package:g_machines/src/features/authentication/guest_screen.dart';
import 'package:g_machines/src/features/authentication/profile_screen.dart';
import 'package:g_machines/src/features/authentication/view/bloc/authentication_cubit.dart';
import 'package:g_machines/src/features/problems/create_problem_screen.dart';
import 'package:g_machines/src/features/problems/read_problem_screen.dart';
import 'package:g_machines/src/features/report/report_screen.dart';
import 'package:g_machines/src/features/sections/section_screen.dart';
import 'package:g_machines/src/features/vehicles/create_vehicle_screen.dart';
import 'package:g_machines/src/features/vehicles/vehicle_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum AppRoutes { home, vehicles, report, auth, readProblem, createProblem, profile, createVehicle, guest }

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoutes.auth.name,
      builder: (context, state) => const AuthScreen(),
      routes: [
        GoRoute(path: 'guest', name: AppRoutes.guest.name, builder: (context, state) => const GuestScreen()),
        GoRoute(
            redirect: (context, state) {
              final supabase = Supabase.instance.client;
              final session = supabase.auth.currentSession;
              if (session == null) {
                return '/';
              }
            },
            path: 'home',
            name: AppRoutes.home.name,
            builder: (context, state) {
              //final supabase = Supabase.instance.client;
              ///Null check fail
              //final id = supabase.auth.currentUser!.id;
              //context.read<AuthenticationCubit>().getProfile(id);
              return BlocBuilder<AuthenticationCubit, AuthenticationState>(
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case AuthenticationEmpty:
                      return const NoProfile();
                    case AuthenticationLoading:
                      return const LoadingPage();
                    case AuthenticationError:

                      /// TODO: get error message
                      return const ErrorPage();
                    case UserAuthenticated:
                      return const SectionScreen();
                    default:

                      /// TODO: get error message
                      return const ErrorPage();
                  }
                },
              );
            },
            routes: [
              GoRoute(
                  redirect: (context, state) {
                    final supabase = Supabase.instance.client;
                    final session = supabase.auth.currentSession;
                    if (session == null) {
                      return '/';
                    }
                  },
                  path: 'vehicles',
                  name: AppRoutes.vehicles.name,
                  builder: (context, state) {
                    return VehicleScreen(
                      sectionId: state.uri.queryParameters['sectionId']!,
                    );
                  },
                  routes: [
                    GoRoute(
                      redirect: (context, state) {
                        final supabase = Supabase.instance.client;
                        final session = supabase.auth.currentSession;
                        if (session == null) {
                          return '/';
                        }
                      },
                      path: 'createVehicle',
                      name: AppRoutes.createVehicle.name,
                      builder: (context, state) {
                        return CreateVehicleScreen(
                          sectionId: state.uri.queryParameters['sectionId']!,
                        );
                      },
                    ),
                    GoRoute(
                      redirect: (context, state) {
                        final supabase = Supabase.instance.client;
                        final session = supabase.auth.currentSession;
                        if (session == null) {
                          return '/';
                        }
                      },
                      path: 'report',
                      name: AppRoutes.report.name,
                      builder: (context, state) {
                        return ReportScreen(
                          vehicleId: state.uri.queryParameters['vehicleId']!,
                        );
                      },
                      routes: [
                        GoRoute(
                          redirect: (context, state) {
                            final supabase = Supabase.instance.client;
                            final session = supabase.auth.currentSession;
                            if (session == null) {
                              return '/';
                            }
                          },
                          path: 'readProblem',
                          name: AppRoutes.readProblem.name,
                          builder: (context, state) {
                            return ReadProblemScreen(
                              problemId: state.uri.queryParameters['problemId']!,
                              vehicleId: state.uri.queryParameters['vehicleId']!,
                            );
                          },
                        ),
                        GoRoute(
                          redirect: (context, state) {
                            final supabase = Supabase.instance.client;
                            final session = supabase.auth.currentSession;
                            if (session == null) {
                              return '/';
                            }
                          },
                          path: 'createProblem',
                          name: AppRoutes.createProblem.name,
                          builder: (context, state) {
                            return CreateProblemScreen(
                              vehicleId: state.uri.queryParameters['vehicleId']!,
                            );
                          },
                        )
                      ],
                    ),
                  ]),
            ]),
        GoRoute(
          redirect: (context, state) {
            final supabase = Supabase.instance.client;
            final session = supabase.auth.currentSession;
            if (session == null) {
              return '/';
            }
          },
          path: 'profile',
          name: AppRoutes.profile.name,
          builder: (context, state) => const ProfileScreen(),
        )
      ],
    ),
  ],
);
