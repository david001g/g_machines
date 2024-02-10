import 'package:g_machines/src/features/vehicles/data/models/vehicle_model.dart';

abstract class VehicleRemoteDataSource {
  Future<List<VehicleModel>> getVehicles();
}
