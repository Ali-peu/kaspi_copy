import 'package:flutter/material.dart';

class ServiceItemWithIconAndName extends StatelessWidget {
  final String name;
  final Widget icon;
  final void Function()? onPressed;
  const ServiceItemWithIconAndName(
      {super.key, required this.name, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            Text(name),
          ]),
    );
  }
}
