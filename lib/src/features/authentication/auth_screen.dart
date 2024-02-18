import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:g_machines/src/config/router/router.dart';
import 'package:g_machines/src/core/constants/constants.dart';
import 'package:g_machines/src/core/utils/print.dart';
import 'package:g_machines/src/features/authentication/auth_functions.dart';
import 'package:g_machines/src/features/authentication/view/bloc/authentication_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        //title: 'G-Machines',
        logo: LogoAssets.whiteLogo,
        onLogin: onLogin,
        onSignup: onSignup,
        onRecoverPassword: (String) {},
        hideForgotPasswordButton: true,
        additionalSignupFields: [
          UserFormField(
            keyName: 'full_name',
            displayName: 'Full Name',
            icon: const Icon(Icons.person),
            fieldValidator: (String) {},
            userType: LoginUserType.name,
          ),
          UserFormField(
            keyName: 'phone_number',
            displayName: 'Phone Number',
            icon: const Icon(Icons.phone),
            fieldValidator: (String) {},
            userType: LoginUserType.intlPhone,
          ),
        ],
        onSubmitAnimationCompleted: () async{
          final supabase = Supabase.instance.client;
          final user = supabase.auth.currentUser;
          if (user != null) {
            final id = user.id;
            await context.read<AuthenticationCubit>().getProfile(id);
            final profile = context.read<AuthenticationCubit>().profile;
            if (profile != null && profile.is_guest!) {
              context.goNamed(AppRoutes.guest.name);
            } else {
              context.goNamed(AppRoutes.home.name);
            }
          }
        },
        navigateBackAfterRecovery: true,
      ),
    );
  }
}

///Login providers
/*
    loginProviders: [
      LoginProvider(
        icon: FontAwesomeIcons.google,
        callback: () {},
        label: 'Google',
      ),
      LoginProvider(
        icon: FontAwesomeIcons.apple,
        callback: () {},
        label: 'Apple',
      ),
    ],
 */
