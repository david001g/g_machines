import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:g_machines/src/core/enums/enums.dart';
import 'package:g_machines/src/features/problems/domain/entities/problem_entity.dart';
import 'package:g_machines/src/features/problems/view/bloc/problem_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/quickalert.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
            decoration: InputDecoration(
              labelText: 'Problem'.tr(),
            ),
            validator: FormBuilderValidators.required(),
            items: ProblemTypes.values
                .map((problem) => DropdownMenuItem(
                      value: problem,
                      child: Text(problem.toString().split('.').last.tr()),
                    ))
                .toList(),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.saveAndValidate()) {
                  final data = formKey.currentState?.value['problem'].toString().split('.').last;

                  final supabase = Supabase.instance.client;
                  final id = supabase.auth.currentUser!.id;

                  ProblemEntity problem = ProblemEntity(
                    name: data,
                    profile_id: id,
                    vehicle_id: int.parse(vehicleId),
                  );

                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.confirm,
                    title: 'Do you want to submit this problem?'.tr(),
                    confirmBtnText: 'Yes'.tr(),
                    cancelBtnText: 'No'.tr(),
                    confirmBtnColor: Colors.green,
                    onConfirmBtnTap: () {
                      context.read<ProblemCubit>().createProblem(problem, int.parse(vehicleId));
                      context.pop();
                      context.pop();
                    },
                  );
                }
              },
              child: const Text('Create').tr()),
        ],
      ),
    );
  }
}
