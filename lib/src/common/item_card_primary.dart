import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  ItemCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.trailing,
    this.subtitle,
  }) : super(key: key);

  final String title;
  final Widget icon;
  final VoidCallback onTap;
  final Widget trailing;
  String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        child: ListTile(
          title: Text(title),
          leading: icon,
          tileColor: Theme.of(context).colorScheme.primaryContainer,
          trailing: trailing,
          subtitle: subtitle != null ? Text(subtitle!) : null,
          onTap: onTap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
