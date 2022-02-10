import 'package:flutter/material.dart';

class GradientColorButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;

  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;
  final double? height;
  final double? width;

  const GradientColorButton(
      {Key? key,
      required this.onPressed,
      required this.child,
      this.borderRadius,
      required this.gradient,
      this.height,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: borderRadius,
        ),
        child: child,
      ),
    );
  }
}
