import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_machines/src/features/authentication/view/bloc/authentication_cubit.dart';
import 'package:g_machines/src/features/vehicles/domain/entities/vehicle_entity.dart';
import 'package:g_machines/src/features/vehicles/view/bloc/vehicle_cubit.dart';
import 'package:g_machines/src/features/vehicles/view/widgets/vehicle_list.dart';

class VehicleListBloc extends StatelessWidget {
  final String sectionId;

  const VehicleListBloc({super.key, required this.sectionId});

  @override
  Widget build(BuildContext context) {
    /// READ vehicles
    final isAdmin = context.read<AuthenticationCubit>().isAdmin!;
    if (isAdmin) {
      context.read<VehicleCubit>().getVehiclesBySection(int.parse(sectionId));
    } else{
      context.read<VehicleCubit>().getVehicles();
    }

    return BlocBuilder<VehicleCubit, VehicleState>(builder: (BuildContext context, VehicleState state) {
      switch (state.runtimeType) {
        case VehicleEmpty:
          return Center(child: const Text('No vehicles found').tr());
        case VehicleLoading:
          return const Center(child: CircularProgressIndicator());
        case VehicleLoaded:
          final vehicles = state.props[0] as List<VehicleEntity>;
          return VehicleList(vehicles: vehicles);
        case VehicleError:
          return Center(
            child: Text('Error loading vehicles'.tr()),
          );
        default:
          return Center(
            child: Text('Error loading vehicles'.tr()),
          );
      }
    });
  }
}
