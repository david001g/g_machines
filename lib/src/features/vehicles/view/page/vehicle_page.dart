import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_machines/src/config/router/router.dart';
import 'package:g_machines/src/core/constants/constants.dart';
import 'package:g_machines/src/features/authentication/view/bloc/authentication_cubit.dart';
import 'package:g_machines/src/features/report/report/view/widgets/section_title.dart';
import 'package:g_machines/src/features/vehicles/domain/entities/vehicle_entity.dart';
import 'package:g_machines/src/features/vehicles/view/page/vehicle_list_bloc.dart';
import 'package:g_machines/src/features/vehicles/view/widgets/vehicle_list.dart';
import 'package:go_router/go_router.dart';

class VehiclePage extends StatelessWidget {
  final String sectionId;

  const VehiclePage({super.key, required this.sectionId});

  @override
  Widget build(BuildContext context) {
    final isAdmin = context.read<AuthenticationCubit>().isAdmin!;

    /// Here you can specify the layout of the page

    return Padding(
      padding: const EdgeInsets.all(PageProperties.padding),
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          SectionTitle(
              title: 'Vehicles',
              trailing: isAdmin
                  ? ElevatedButton.icon(
                      onPressed: () => context.pushNamed(AppRoutes.createVehicle.name, queryParameters: {'sectionId': sectionId}),
                      icon: const Icon(Icons.add),
                      label: const Text("Add").tr())
                  : null),
          VehicleListBloc(sectionId: sectionId),
        ],
      ),
    );
  }
}
