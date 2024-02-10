import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:g_machines/src/config/router/router.dart';
import 'package:g_machines/src/features/authentication/auth_functions.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        title: 'G-Machines',
        onLogin: onLogin,
        onRecoverPassword: (String) {},
        onSignup: onSignup,
        hideForgotPasswordButton: true,
        additionalSignupFields: [
          UserFormField(
            keyName: 'full_name',
            displayName: 'Full Name',
            icon: Icon(Icons.person),
            fieldValidator: (String) {},
            userType: LoginUserType.name,
          ),
          UserFormField(
            keyName: 'username',
            displayName: 'Username',
            icon: Icon(Icons.person),
            fieldValidator: (String) {},
            userType: LoginUserType.name,
          ),
        ],
        onSubmitAnimationCompleted: () {
          context.goNamed(AppRoutes.home.name);
        },
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