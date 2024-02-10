import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_machines/src/features/vehicles/domain/entities/vehicle_entity.dart';
import 'package:g_machines/src/features/vehicles/view/bloc/vehicle_cubit.dart';
import 'package:g_machines/src/features/vehicles/view/widgets/vehicle_list.dart';

class VehiclePage extends StatelessWidget {
  const VehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    /// READ vehicles
    context.read<VehicleCubit>().getVehicles();

    return BlocBuilder<VehicleCubit, VehicleState>(builder: (BuildContext context, VehicleState state) {
      switch (state.runtimeType) {
        case VehicleEmpty:
          return const Center(child: Text('No vehicles found'));
        case VehicleLoading:
          return const Center(child: CircularProgressIndicator());
        case VehicleLoaded:
          final vehicles = state.props[0] as List<VehicleEntity>;
          return VehicleList(vehicles: vehicles);
        case VehicleError:
          return const Center(
            child: Text('Error loading vehicles'),
          );
        default:
          return const Center(
            child: Text('Error loading vehicles'),
          );
      }
    });
  }
}
