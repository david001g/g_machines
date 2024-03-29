import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_machines/src/common/item_card.dart';
import 'package:g_machines/src/core/utils/get_problem_image.dart';
import 'package:g_machines/src/features/authentication/view/bloc/authentication_cubit.dart';
import 'package:g_machines/src/features/problems/view/bloc/problem_cubit.dart';
import 'package:g_machines/src/features/report/report/view/widgets/section_title.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ReadProblemForm extends StatelessWidget {
  final String problemId;
  final String vehicleId;

  const ReadProblemForm({super.key, required this.problemId, required this.vehicleId});

  @override
  Widget build(BuildContext context) {
    final isAdmin = context.read<AuthenticationCubit>().isAdmin!;

    return SingleChildScrollView(
      child: Column(
        children: [
          const SectionTitle(title: 'Driver details'),
          FutureBuilder(
            future: context.read<ProblemCubit>().getProfileByProblem(int.parse(problemId)),
            builder: (context,snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text('Error'));
              }
              return ItemCard(
                title: snapshot.data!.full_name!,
                subtitle: snapshot.data!.phone_number!,
                trailing: const Icon(
                  Icons.account_circle_rounded,
                  size: 40.0,
                ),
              );
            },
          ),
          const SectionTitle(title: 'Problem description'),
          FutureBuilder(
              future: context.read<ProblemCubit>().getProblemEntity(int.parse(problemId)),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Center(child: Text('Error'));
                }
                return Column(
                  children: [
                    ItemCard(
                      title: snapshot.data!.name!,
                      subtitle: snapshot.data!.created_at!,
                      icon: getProblemImage(snapshot.data!.name!),
                    ),
                    isAdmin
                        ? ElevatedButton(
                            onPressed: () {
                              QuickAlert.show(
                                context: context,
                                type: QuickAlertType.confirm,
                                title: 'Do you want to delete this problem?'.tr(),
                                confirmBtnText: 'Yes'.tr(),
                                cancelBtnText: 'No'.tr(),
                                confirmBtnColor: Colors.green,
                                onConfirmBtnTap: () {
                                  context.read<ProblemCubit>().deleteProblem(snapshot.data!, int.parse(vehicleId));
                                  context.pop();
                                  context.pop();
                                },
                              );
                            },
                            child: Text('Solve'.tr()))
                        : const SizedBox(),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
