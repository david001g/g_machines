import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:g_machines/src/core/enums/enums.dart';
import 'package:g_machines/src/features/vehicles/domain/entities/vehicle_entity.dart';
import 'package:g_machines/src/features/vehicles/view/bloc/vehicle_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class CreateVehicleForm extends StatelessWidget {
  final String sectionId;
  const CreateVehicleForm({super.key, required this.sectionId});

  @override
  Widget build(BuildContext context) {
    final sectionNumbers = List.generate(9, (index) => index + 1);

    final formKey = GlobalKey<FormBuilderState>();
    return FormBuilder(
      key: formKey,
      child: Column(
        children: [
          FormBuilderDropdown(
            name: 'vehicleType',
            decoration: InputDecoration(
              labelText: 'Vehicle type'.tr(),
            ),
            validator: FormBuilderValidators.required(),
            items: VehicleTypes.values
                .map((vehicleType) =>
                DropdownMenuItem(
                  value: vehicleType,
                  child: Text(vehicleType
                      .toString()
                      .split('.')
                      .last).tr(),
                ))
                .toList(),
          ),
          FormBuilderDropdown(name: 'sectionNumber',
              items: sectionNumbers.map((sectionNumber) =>
                  DropdownMenuItem(value: sectionNumber, child: Text(sectionNumber.toString()))).toList(),
              validator: FormBuilderValidators.required(),
              decoration: InputDecoration(labelText: 'Section number'.tr())),
              const SizedBox(height: 20),
          FormBuilderTextField(
            name: 'plateNumber',
            decoration: InputDecoration(
              labelText: 'Plate number'.tr(),
            ),
            validator: FormBuilderValidators.required(),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.saveAndValidate()) {
                  final vehicleType = formKey.currentState?.value['vehicleType']
                      .toString()
                      .split('.')
                      .last;
                  final plateNumber = formKey.currentState?.value['plateNumber'];
                  final sectionNumber = formKey.currentState?.value['sectionNumber'];
                  VehicleEntity vehicle = VehicleEntity(
                    section_id: sectionNumber,
                    vehicle_type: vehicleType,
                    plate_number: plateNumber,
                  );
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.confirm,
                    title: 'Do you want to submit this problem?'.tr(),
                    confirmBtnText: 'Yes'.tr(),
                    cancelBtnText: 'No'.tr(),
                    confirmBtnColor: Colors.green,
                    onConfirmBtnTap: () {
                      context.read<VehicleCubit>().createVehicle(vehicle, int.parse(sectionId));
                      context.pop();
                      context.pop();
                    },
                  );
                }
              },
              child: Text('Create'.tr())),
        ],
      ),
    );
  }
}
