import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_machines/src/common/item_card.dart';
import 'package:g_machines/src/config/router/router.dart';
import 'package:g_machines/src/core/constants/constants.dart';
import 'package:g_machines/src/features/authentication/view/bloc/authentication_cubit.dart';
import 'package:g_machines/src/features/report/report/view/widgets/section_title.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = context.read<AuthenticationCubit>().profile!;

    return Padding(
      padding: const EdgeInsets.all(PageProperties.padding),
      child: Column(children: [
         ItemCard(
            title: profile.full_name!,
            subtitle: profile.phone_number!,
            trailing: const Icon(
              Icons.account_circle_rounded,
              size: 40.0,
            )),
        const SectionTitle(title: 'Language'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('HUN')),
            ElevatedButton(onPressed: () {}, child: const Text('ENG')),
            ElevatedButton(onPressed: () {}, child: const Text('中文'))
          ],
        ),
        const SectionTitle(title: 'Logout'),
        ElevatedButton(
            onPressed: () async {
              final supabase = Supabase.instance.client;
              await supabase.auth.signOut();
              if (context.mounted) context.pushNamed(AppRoutes.auth.name);
            },
            child: const Text('Logout'))
      ]),
    );
  }
}
