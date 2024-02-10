import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:g_machines/src/features/vehicles/domain/entities/vehicle_entity.dart';
import 'package:g_machines/src/features/vehicles/domain/usecases/create_vehicle.dart';
import 'package:g_machines/src/features/vehicles/domain/usecases/delete_vehicle.dart';
import 'package:g_machines/src/features/vehicles/domain/usecases/get_vehicle.dart';
import 'package:g_machines/src/features/vehicles/domain/usecases/get_vehicles.dart';
import 'package:g_machines/src/features/vehicles/domain/usecases/update_vehicle.dart';

part 'vehicle_state.dart';

class VehicleCubit extends Cubit<VehicleState> {
  final CreateVehicle createVehicleUsecase;
  final DeleteVehicle deleteVehicleUsecase;
  final UpdateVehicle updateVehicleUsecase;
  final GetVehicle getVehicleUsecase;
  final GetVehicles getVehiclesUsecase;

  VehicleCubit(this.createVehicleUsecase, this.deleteVehicleUsecase, this.updateVehicleUsecase, this.getVehicleUsecase,
      this.getVehiclesUsecase)
      : super(VehicleEmpty());

  Future<void> getVehicles() async {
    emit(VehicleLoading());
    final result = await getVehiclesUsecase.call();
    result.fold(
      (failure) => emit(VehicleError(message: failure.message)),
      (vehicles) => emit(VehicleLoaded(vehicles: vehicles)),
    );
  }

  Future<void> createVehicle(VehicleEntity vehicle) async {
    emit(VehicleLoading());
    final result = await createVehicleUsecase.call(vehicle);
    result.fold(
      (failure) => emit(VehicleError(message: failure.message)),
      (vehicle) => getVehicles,
    );
  }

  Future<void> updateVehicle(VehicleEntity vehicle) async {
    emit(VehicleLoading());
    final result = await updateVehicleUsecase.call(vehicle);
    result.fold(
      (failure) => emit(VehicleError(message: failure.message)),
      (vehicle) => getVehicles,
    );
  }

  Future<void> deleteVehicle(int id) async {
    emit(VehicleLoading());
    final result = await deleteVehicleUsecase.call(id);
    result.fold(
      (failure) => emit(VehicleError(message: failure.message)),
      (vehicle) => getVehicles,
    );
  }
}
