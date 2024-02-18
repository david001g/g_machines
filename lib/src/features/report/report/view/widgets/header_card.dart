import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_machines/src/common/item_card.dart';
import 'package:g_machines/src/core/utils/get_vehicle_image.dart';
import 'package:g_machines/src/features/vehicles/view/bloc/vehicle_cubit.dart';

class HeaderCard extends StatelessWidget {
  final String vehicleId;

  const HeaderCard({super.key, required this.vehicleId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.read<VehicleCubit>().getVehicle(int.parse(vehicleId)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          }
          return ItemCard(
            icon: getVehicleImage(snapshot.data!.vehicle_type!),
            title: snapshot.data!.vehicle_type!,
            subtitle: snapshot.data!.plate_number!,
          );
        });
  }
}
/*
ItemCard(
      title: "Header",
      icon: Icon(Icons.accessible_forward_rounded),
      subtitle: "Subtitle",
    )
 */
