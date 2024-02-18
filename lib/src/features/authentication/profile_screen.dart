import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:g_machines/src/common/my_appbar.dart';
import 'package:g_machines/src/features/authentication/view/bloc/authentication_cubit.dart';
import 'package:g_machines/src/features/authentication/view/page/profile_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    final id = supabase.auth.currentUser!.id;
    context.read<AuthenticationCubit>().getProfile(id);

    return Scaffold(
      appBar: const MyAppBar(name: 'Profile', isHome: false, isProfile: true),
      body: BlocBuilder<AuthenticationCubit, AuthenticationState>(builder: (BuildContext context, AuthenticationState state) {
        switch (state.runtimeType) {
          case AuthenticationEmpty:
            return Center(child: const Text('No profile found').tr());
          case AuthenticationLoading:
            return const Center(child: CircularProgressIndicator());
          case AuthenticationError:
            return Center(child: const Text('Error loading profile').tr());
          case UserAuthenticated:
            return const Center(child: ProfilePage());
          default:
            return Center(child: const Text('Error loading profile').tr());
        }
      }),
    );
  }
}
