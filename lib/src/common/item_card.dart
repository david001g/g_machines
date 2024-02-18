import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final Widget? icon;
  final VoidCallback? onTap;
  final Widget? trailing;
  final String? subtitle;

  const ItemCard({
    Key? key,
    required this.title,
    this.icon,
    this.trailing,
    this.onTap,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Card(
        margin: const EdgeInsets.all(0),
        elevation: 3,
        child: ListTile(
          title: Text(title.tr(), style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400)),
          leading: icon,
          tileColor: Theme.of(context).colorScheme.primaryContainer,
          trailing: trailing,
          subtitle: subtitle != null
              ? Text(
                  subtitle!.tr(),
                  style: const TextStyle(fontSize: 14.0),
                )
              : null,
          onTap: onTap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
