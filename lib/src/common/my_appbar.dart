import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:g_machines/src/config/router/router.dart';
import 'package:g_machines/src/core/constants/constants.dart';
import 'package:go_router/go_router.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isHome;
  final bool isProfile;
  final String name;

  const MyAppBar({super.key, required this.isHome, required this.name, required this.isProfile});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      centerTitle: true,
      title: Text(name.tr(), style: const TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold)),
      automaticallyImplyLeading: true,
      leading: isHome ? Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Image.asset(LogoAssets.logo, height: 25.0),
      ) : null,
      actions: [
        isProfile
            ? const SizedBox()
            : IconButton(
                icon: const Icon(Icons.account_circle_rounded, size: 30.0),
                onPressed: () => context.pushNamed(AppRoutes.profile.name),
                padding: const EdgeInsets.only(right: 20.0),
              ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
