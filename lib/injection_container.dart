import 'package:g_machines/src/features/authentication/data/repositories/profile_repository_impl.dart';
import 'package:g_machines/src/features/authentication/domain/repositories/profile_repository.dart';
import 'package:g_machines/src/features/authentication/domain/usecases/create_profile.dart';
import 'package:g_machines/src/features/authentication/domain/usecases/delete_profile.dart';
import 'package:g_machines/src/features/authentication/domain/usecases/get_profile.dart';
import 'package:g_machines/src/features/authentication/domain/usecases/update_profile.dart';
import 'package:g_machines/src/features/authentication/view/bloc/authentication_cubit.dart';
import 'package:g_machines/src/features/problems/data/repositories/problem_repository_impl.dart';
import 'package:g_machines/src/features/problems/domain/repositories/problem_repository.dart';
import 'package:g_machines/src/features/problems/domain/usecases/create_problem.dart';
import 'package:g_machines/src/features/problems/domain/usecases/delete_problem.dart';
import 'package:g_machines/src/features/problems/domain/usecases/get_problem.dart';
import 'package:g_machines/src/features/problems/domain/usecases/get_problems.dart';
import 'package:g_machines/src/features/problems/domain/usecases/get_problems_by_vehicle.dart';
import 'package:g_machines/src/features/problems/domain/usecases/update_problem.dart';
import 'package:g_machines/src/features/problems/view/bloc/problem_cubit.dart';
import 'package:g_machines/src/features/sections/data/repositories/section_repository_impl.dart';
import 'package:g_machines/src/features/sections/domain/repositories/section_repository.dart';
import 'package:g_machines/src/features/sections/domain/usecases/count_vehicles.dart';
import 'package:g_machines/src/features/sections/domain/usecases/create_section.dart';
import 'package:g_machines/src/features/sections/domain/usecases/delete_section.dart';
import 'package:g_machines/src/features/sections/domain/usecases/get_section.dart';
import 'package:g_machines/src/features/sections/domain/usecases/get_sections.dart';
import 'package:g_machines/src/features/sections/domain/usecases/update_section.dart';
import 'package:g_machines/src/features/sections/view/bloc/section_cubit.dart';
import 'package:g_machines/src/features/vehicles/data/repositories/vehicle_repository_impl.dart';
import 'package:g_machines/src/features/vehicles/domain/repositories/vehicle_repository.dart';
import 'package:g_machines/src/features/vehicles/domain/usecases/count_problems.dart';
import 'package:g_machines/src/features/vehicles/domain/usecases/create_vehicle.dart';
import 'package:g_machines/src/features/vehicles/domain/usecases/delete_vehicle.dart';
import 'package:g_machines/src/features/vehicles/domain/usecases/get_vehicle.dart';
import 'package:g_machines/src/features/vehicles/domain/usecases/get_vehicles.dart';
import 'package:g_machines/src/features/vehicles/domain/usecases/get_vehicles_by_section.dart';
import 'package:g_machines/src/features/vehicles/domain/usecases/update_vehicle.dart';
import 'package:g_machines/src/features/vehicles/view/bloc/vehicle_cubit.dart';
import 'package:get_it/get_it.dart';

import 'src/features/authentication/domain/usecases/get_profiles.dart';

final sl = GetIt.instance;

void setupLocator() {
  //cubit
  sl.registerFactory(() => SectionCubit(sl(), sl(), sl(), sl(), sl(), sl()));
  sl.registerFactory(() => VehicleCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl()));
  sl.registerFactory(() => ProblemCubit(sl(), sl(), sl(), sl(), sl(), sl()));
  sl.registerFactory(() => AuthenticationCubit(sl(), sl(), sl(), sl(), sl()));

  //use-cases
  sl.registerLazySingleton(() => CreateSection(sl()));
  sl.registerLazySingleton(() => GetSections(sl()));
  sl.registerLazySingleton(() => GetSection(sl()));
  sl.registerLazySingleton(() => DeleteSection(sl()));
  sl.registerLazySingleton(() => UpdateSection(sl()));
  sl.registerLazySingleton(() => CountVehicles(sl()));

  sl.registerLazySingleton(() => CreateVehicle(sl()));
  sl.registerLazySingleton(() => GetVehicles(sl()));
  sl.registerLazySingleton(() => GetVehiclesBySection(sl()));
  sl.registerLazySingleton(() => GetVehicle(sl()));
  sl.registerLazySingleton(() => DeleteVehicle(sl()));
  sl.registerLazySingleton(() => UpdateVehicle(sl()));
  sl.registerLazySingleton(() => CountProblems(sl()));

  sl.registerLazySingleton(() => CreateProblem(sl()));
  sl.registerLazySingleton(() => GetProblems(sl()));
  sl.registerLazySingleton(() => GetProblemsByVehicle(sl()));
  sl.registerLazySingleton(() => GetProblem(sl()));
  sl.registerLazySingleton(() => DeleteProblem(sl()));
  sl.registerLazySingleton(() => UpdateProblem(sl()));

  sl.registerLazySingleton(() => CreateProfile(sl()));
  sl.registerLazySingleton(() => GetProfile(sl()));
  sl.registerLazySingleton(() => UpdateProfile(sl()));
  sl.registerLazySingleton(() => DeleteProfile(sl()));
  sl.registerLazySingleton(() => GetProfiles(sl()));

  //repository
  sl.registerLazySingleton<SectionRepository>(() => SectionRepositoryImpl());
  sl.registerLazySingleton<VehicleRepository>(() => VehicleRepositoryImpl());
  sl.registerLazySingleton<ProblemRepository>(() => ProblemRepositoryImpl());
  sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl());
}
