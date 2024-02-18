import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_machines/src/common/my_appbar.dart';
import 'package:g_machines/src/features/vehicles/domain/entities/vehicle_entity.dart';
import 'package:g_machines/src/features/vehicles/view/bloc/vehicle_cubit.dart';
import 'package:g_machines/src/features/vehicles/view/page/vehicle_page.dart';

class UserVehicleScreen extends StatelessWidget {
  const UserVehicleScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    /// READ vehicles
    context.read<VehicleCubit>().getVehicles();
    return Scaffold(
      appBar: const MyAppBar(name: 'Vehicles', isHome: false, isProfile: false),
      body: BlocBuilder<VehicleCubit, VehicleState>(builder: (BuildContext context, VehicleState state) {
        switch (state.runtimeType) {
          case VehicleEmpty:
            return const Center(child: Text('No vehicles found'));
          case VehicleLoading:
            return const Center(child: CircularProgressIndicator());
          case VehicleLoaded:
            final vehicles = state.props[0] as List<VehicleEntity>;
            return const VehiclePage(sectionId: 's',);
          case VehicleError:
            return const Center(
              child: Text('Error loading vehicles'),
            );
          default:
            return const Center(
              child: Text('Error loading vehicles'),
            );
        }
      }),
    );
  }
}
