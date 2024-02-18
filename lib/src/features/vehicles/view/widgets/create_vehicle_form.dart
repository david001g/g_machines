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
  const CreateVehicleForm({super.key});

  @override
  Widget build(BuildContext context) {
    final sectionNumbers = List.generate(13, (index) => index + 1);

    final formKey = GlobalKey<FormBuilderState>();
    return FormBuilder(
      key: formKey,
      child: Column(
        children: [
          FormBuilderDropdown(
            name: 'vehicleType',
            decoration: const InputDecoration(
              labelText: 'Vehicle type',
            ),
            validator: FormBuilderValidators.required(),
            items: VehicleTypes.values
                .map((vehicleType) =>
                DropdownMenuItem(
                  value: vehicleType,
                  child: Text(vehicleType
                      .toString()
                      .split('.')
                      .last),
                ))
                .toList(),
          ),
          FormBuilderDropdown(name: 'sectionNumber',
              items: sectionNumbers.map((sectionNumber) =>
                  DropdownMenuItem(value: sectionNumber, child: Text(sectionNumber.toString()))).toList(),
              validator: FormBuilderValidators.required(),
              decoration: const InputDecoration(labelText: 'Section number')),
              const SizedBox(height: 20),
          FormBuilderTextField(
            name: 'plateNumber',
            decoration: const InputDecoration(
              labelText: 'Plate number',
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
                    title: 'Do you want to submit this problem?',
                    confirmBtnText: 'Yes',
                    cancelBtnText: 'No',
                    confirmBtnColor: Colors.green,
                    onConfirmBtnTap: () {
                      context.read<VehicleCubit>().createVehicle(vehicle);
                      context.pop();
                      context.pop();
                    },
                  );
                }
              },
              child: const Text('Create')),
        ],
      ),
    );
  }
}
