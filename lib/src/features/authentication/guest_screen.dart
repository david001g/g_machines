import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:g_machines/src/config/router/router.dart';
import 'package:g_machines/src/core/constants/constants.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GuestScreen extends StatelessWidget {
  const GuestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(PageProperties.padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('You are a guest'.tr(),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
              Lottie.asset(LottieAssets.contactUs),
              Text('Please contact the admin to get access:'.tr(), textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
              const Text('+36703768780', style: TextStyle(fontSize: 20, color: Colors.blueAccent)),
              ElevatedButton(
                  onPressed: () async {
                    final supabase = Supabase.instance.client;
                    await supabase.auth.signOut();
                    if (context.mounted) context.pushNamed(AppRoutes.auth.name);
                  },
                  child: const Text('Logout').tr()),
            ],
          ),
        ),
      ),
    );
  }
}
