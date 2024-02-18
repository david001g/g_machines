import 'package:flutter/material.dart';
import 'package:g_machines/src/core/constants/constants.dart';

Image getVehicleImage(String vehicleType) {
  switch (vehicleType) {
    case 'EXCAVATOR':
      return const Image(image: AssetImage(VehicleTypeAssets.excavator), width: 50, height: 50);
    case 'BULLDOZER':
      return const Image(image: AssetImage(VehicleTypeAssets.bulldozer), width: 50, height: 50);
    case 'GCB':
      return const Image(image: AssetImage(VehicleTypeAssets.gcb), width: 50, height: 50);
    case 'GRADER':
      return const Image(image: AssetImage(VehicleTypeAssets.grader), width: 50, height: 50);
    case 'LOADER':
      return const Image(image: AssetImage(VehicleTypeAssets.loader), width: 50, height: 50);
    case 'ROLLER':
      return const Image(image: AssetImage(VehicleTypeAssets.roller), width: 50, height: 50);
    case 'KCR':
      return const Image(image: AssetImage(VehicleTypeAssets.kcr), width: 50, height: 50);
    case 'SPRINKLER':
      return const Image(image: AssetImage(VehicleTypeAssets.sprinkler), width: 50, height: 50);
    case 'TIPPER':
      return const Image(image: AssetImage(VehicleTypeAssets.tipper), width: 50, height: 50);
    default:
      return const Image(image: AssetImage(VehicleTypeAssets.excavator), width: 50, height: 50);
  }
}
