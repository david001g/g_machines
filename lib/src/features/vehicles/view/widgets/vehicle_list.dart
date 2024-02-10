import 'package:flutter/material.dart';
import 'package:g_machines/src/common/item_card_primary.dart';
import 'package:g_machines/src/features/vehicles/domain/entities/vehicle_entity.dart';

class VehicleList extends StatelessWidget {
  final List<VehicleEntity> vehicles;

  const VehicleList({super.key, required this.vehicles});

  @override
  Widget build(BuildContext context) {
    return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        children: vehicles
            .map((vehicle) => ItemCard(
                  title: vehicle.name!,
                  subtitle: vehicle.vehicle_type!,
                  onTap: () {},
                  icon: const Icon(Icons.directions_car),
                  trailing: const SizedBox(
                    width: 50,
                    height: 50,
                    child: Placeholder(),
                  ),
                ))
            .toList());
  }
}
