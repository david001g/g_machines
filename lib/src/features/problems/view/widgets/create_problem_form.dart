import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:g_machines/src/core/enums/enums.dart';
import 'package:g_machines/src/features/problems/domain/entities/problem_entity.dart';
import 'package:g_machines/src/features/problems/view/bloc/problem_cubit.dart';
import 'package:g_machines/src/features/vehicles/domain/entities/vehicle_entity.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/quickalert.dart';

class CreateProblemForm extends StatelessWidget {
  final String vehicleId;

  const CreateProblemForm({super.key, required this.vehicleId});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();

    return FormBuilder(
      key: formKey,
      child: Column(
        children: [
          FormBuilderDropdown(
            name: 'problem',
            decoration: const InputDecoration(
              labelText: 'Problem',
            ),
            validator: FormBuilderValidators.required(),
            items: ProblemTypes.values
                .map((problem) => DropdownMenuItem(
                      value: problem,
                      child: Text(problem.toString().split('.').last),
                    ))
                .toList(),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.saveAndValidate()) {
                  final data = formKey.currentState?.value['problem'].toString().split('.').last;

                  ProblemEntity problem = ProblemEntity(
                    name: data,
                    vehicle_id: int.parse(vehicleId),
                  );

                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.confirm,
                    title: 'Do you want to submit this problem?',
                    confirmBtnText: 'Yes',
                    cancelBtnText: 'No',
                    confirmBtnColor: Colors.green,
                    onConfirmBtnTap: () {
                      context.read<ProblemCubit>().createProblem(problem);
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
