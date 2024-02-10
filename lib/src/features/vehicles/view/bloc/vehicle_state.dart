part of 'vehicle_cubit.dart';

abstract class VehicleState extends Equatable {
  const VehicleState();

  @override
  List<Object> get props => [];
}

class VehicleEmpty extends VehicleState {

}
class VehicleLoading extends VehicleState {

}
class VehicleLoaded extends VehicleState {
  final List<VehicleEntity> vehicles;

  const VehicleLoaded({required this.vehicles});

  @override
  List<Object> get props => [vehicles];
}
class VehicleError extends VehicleState {
  final String message;

  const VehicleError({required this.message});

  @override
  List<Object> get props => [message];
}
