import 'package:flutter/material.dart';

class CircleTextWidget extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;

  const CircleTextWidget(
      {super.key, required this.child, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: height ?? 12,
      height: width ?? 12,
      child: child,
    );
  }
}
