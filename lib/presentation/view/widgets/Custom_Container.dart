import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.child,
    this.radius,
    this.color,
    this.width,
  });

  final Widget child;
  final double? radius;
  final Color? color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius ?? 20),
      color: color ?? Colors.white),
      child: child,
    );
  }
}
