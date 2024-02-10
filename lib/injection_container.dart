import 'package:g_machines/src/features/sections/data/repositories/section_repository_impl.dart';
import 'package:g_machines/src/features/sections/domain/repositories/section_repository.dart';
import 'package:g_machines/src/features/sections/domain/usecases/create_section.dart';
import 'package:g_machines/src/features/sections/domain/usecases/delete_section.dart';
import 'package:g_machines/src/features/sections/domain/usecases/get_section.dart';
import 'package:g_machines/src/features/sections/domain/usecases/get_sections.dart';
import 'package:g_machines/src/features/sections/domain/usecases/update_section.dart';
import 'package:g_machines/src/features/sections/view/bloc/section_cubit.dart';
import 'package:g_machines/src/features/vehicles/data/repositories/vehicle_repository_impl.dart';
import 'package:g_machines/src/features/vehicles/domain/repositories/vehicle_repository.dart';
import 'package:g_machines/src/features/vehicles/domain/usecases/create_vehicle.dart';
import 'package:g_machines/src/features/vehicles/domain/usecases/delete_vehicle.dart';
import 'package:g_machines/src/features/vehicles/domain/usecases/get_vehicle.dart';
import 'package:g_machines/src/features/vehicles/domain/usecases/get_vehicles.dart';
import 'package:g_machines/src/features/vehicles/domain/usecases/update_vehicle.dart';
import 'package:g_machines/src/features/vehicles/view/bloc/vehicle_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupLocator() {
  //cubit
  sl.registerFactory(() => SectionCubit(sl(), sl(), sl(), sl(), sl()));
  sl.registerFactory(() => VehicleCubit(sl(), sl(), sl(), sl(), sl()));
  //usecases
  sl.registerLazySingleton(() => CreateSection(sl()));
  sl.registerLazySingleton(() => GetSections(sl()));
  sl.registerLazySingleton(() => GetSection(sl()));
  sl.registerLazySingleton(() => DeleteSection(sl()));
  sl.registerLazySingleton(() => UpdateSection(sl()));

  sl.registerLazySingleton(() => CreateVehicle(sl()));
  sl.registerLazySingleton(() => GetVehicles(sl()));
  sl.registerLazySingleton(() => GetVehicle(sl()));
  sl.registerLazySingleton(() => DeleteVehicle(sl()));
  sl.registerLazySingleton(() => UpdateVehicle(sl()));

  //repository
  sl.registerLazySingleton<SectionRepository>(() => SectionRepositoryImpl());
  sl.registerLazySingleton<VehicleRepository>(() => VehicleRepositoryImpl());
}
