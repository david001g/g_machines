import 'package:flutter/material.dart';
import 'package:g_machines/src/common/item_card.dart';
import 'package:g_machines/src/config/router/router.dart';
import 'package:g_machines/src/core/utils/get_vehicle_image.dart';
import 'package:g_machines/src/features/vehicles/domain/entities/vehicle_entity.dart';
import 'package:go_router/go_router.dart';
import 'package:badges/badges.dart' as badges;

class VehicleList extends StatelessWidget {
  final List<VehicleEntity> vehicles;

  const VehicleList({super.key, required this.vehicles});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: vehicles.map((vehicle){
      return ItemCard(
        title: vehicle.vehicle_type!,
        subtitle: vehicle.plate_number!,
        onTap: () => context.pushNamed(AppRoutes.report.name, queryParameters: {'vehicleId': vehicle.id!.toString()}),
        icon: getVehicleImage(vehicle.vehicle_type!),
        trailing: badges.Badge(
          badgeContent: Text(vehicle.problem_count.toString()),
          child: const Icon(Icons.report),
        ),
      );
    }).toList());
  }
}

