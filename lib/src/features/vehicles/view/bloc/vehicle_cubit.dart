import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:g_machines/src/core/error/failure.dart';
import 'package:g_machines/src/features/vehicles/domain/entities/vehicle_entity.dart';
import 'package:g_machines/src/features/vehicles/domain/usecases/count_problems.dart';
import 'package:g_machines/src/features/vehicles/domain/usecases/create_vehicle.dart';
import 'package:g_machines/src/features/vehicles/domain/usecases/delete_vehicle.dart';
import 'package:g_machines/src/features/vehicles/domain/usecases/get_vehicle.dart';
import 'package:g_machines/src/features/vehicles/domain/usecases/get_vehicles.dart';
import 'package:g_machines/src/features/vehicles/domain/usecases/get_vehicles_by_section.dart';
import 'package:g_machines/src/features/vehicles/domain/usecases/update_vehicle.dart';

part 'vehicle_state.dart';

class VehicleCubit extends Cubit<VehicleState> {
  final CreateVehicle createVehicleUsecase;
  final DeleteVehicle deleteVehicleUsecase;
  final UpdateVehicle updateVehicleUsecase;
  final GetVehicle getVehicleUsecase;
  final GetVehicles getVehiclesUsecase;
  final GetVehiclesBySection getVehiclesBySectionUsecase;
  final CountProblems countProblemsByVehicleUsecase;

  VehicleCubit(this.createVehicleUsecase, this.deleteVehicleUsecase, this.updateVehicleUsecase, this.getVehicleUsecase,
      this.getVehiclesUsecase, this.getVehiclesBySectionUsecase, this.countProblemsByVehicleUsecase)
      : super(VehicleEmpty());

  Future<VehicleEntity> getVehicle(int id) async {
    final result = await getVehicleUsecase.call(id);
    return result.fold((failure) {
      throw Exception(failure.message);
    }, (vehicle) {
      return vehicle;
    });
  }

  Future<void> getVehicles() async {
    emit(VehicleLoading());
    final result = await getVehiclesUsecase.call();
    result.fold(
      (failure) => emit(VehicleError(message: failure.message)),
      (vehicles) {
        if (vehicles.isEmpty) {
          emit(VehicleEmpty());
        } else {
          emit(VehicleLoaded(vehicles: vehicles));
        }
      },
    );
  }

  Future<void> getVehiclesBySection(int id) async {
    emit(VehicleLoading());
    final result = await getVehiclesBySectionUsecase.call(id);

    result.fold((failure) => emit(VehicleError(message: failure.message)), (vehicles) {
      if (vehicles.isEmpty) {
        emit(VehicleEmpty());
      } else {
        emit(VehicleLoaded(vehicles: vehicles));
      }
    });
  }

  Future<void> createVehicle(VehicleEntity vehicle, int sectionId) async {
    emit(VehicleLoading());
    final result = await createVehicleUsecase.call(vehicle);
    result.fold(
      (failure) => emit(VehicleError(message: failure.message)),
      (vehicle) => getVehiclesBySection(sectionId),
    );
  }

  Future<void> updateVehicle(VehicleEntity vehicle) async {
    emit(VehicleLoading());
    final result = await updateVehicleUsecase.call(vehicle);
    result.fold(
      (failure) => emit(VehicleError(message: failure.message)),
      (vehicle) => getVehicles(),
    );
  }

  Future<void> deleteVehicle(int id) async {
    emit(VehicleLoading());
    final result = await deleteVehicleUsecase.call(id);
    result.fold(
      (failure) => emit(VehicleError(message: failure.message)),
      (vehicle) => getVehicles(),
    );
  }
}
