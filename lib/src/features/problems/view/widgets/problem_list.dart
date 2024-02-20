import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_machines/src/common/item_card.dart';
import 'package:g_machines/src/config/router/router.dart';
import 'package:g_machines/src/core/utils/get_problem_image.dart';
import 'package:g_machines/src/features/authentication/domain/entities/profile_entity.dart';
import 'package:g_machines/src/features/authentication/view/bloc/authentication_cubit.dart';
import 'package:g_machines/src/features/problems/domain/entities/problem_entity.dart';
import 'package:g_machines/src/features/problems/view/bloc/problem_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/quickalert.dart';

class ProblemList extends StatelessWidget {
  final List<ProblemEntity> problems;
  final String vehicleId;

  const ProblemList({super.key, required this.problems, required this.vehicleId});

  @override
  Widget build(BuildContext context) {
    final isAdmin = context.read<AuthenticationCubit>().isAdmin!;
    return Column(
        children: problems
            .map((problem) => ItemCard(
                  title: problem.name!,
                  onTap: () => context.pushNamed(AppRoutes.readProblem.name, queryParameters: {'problemId': problem.id.toString(), 'vehicleId': vehicleId}),
                  trailing:  isAdmin ? IconButton(
                    onPressed: () {
                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.confirm,
                          title: 'Do you want to delete this problem?'.tr(),
                          confirmBtnText: 'Yes'.tr(),
                          cancelBtnText: 'No'.tr(),
                          confirmBtnColor: Colors.green,
                          onConfirmBtnTap: () {
                            context.read<ProblemCubit>().deleteProblem(problem, int.parse(vehicleId));
                            context.pop();
                          });
                    },
                    icon: const Icon(Icons.delete, color: Colors.red),
                  ) : null,
                  icon: getProblemImage(problem.name!),
                ) )
            .toList());
  }
}
