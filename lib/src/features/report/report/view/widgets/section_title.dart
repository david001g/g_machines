import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final Widget? trailing;

  const SectionTitle({super.key, required this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(title, style: const TextStyle(fontSize: 22.0, fontStyle: FontStyle.italic)),
            trailing ?? const SizedBox(),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
