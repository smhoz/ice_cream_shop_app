import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';
import '../../utilies/border/border_radius.dart';

class TwoColorButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? leftContainerColor;
  final Widget child;
  final double? width;
  final double? height;
  final String? text;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final TextStyle? textStyle;
  const TwoColorButton(
      {Key? key,
      this.backgroundColor,
      this.leftContainerColor,
      required this.child,
      this.width,
      this.height,
      this.text,
      this.onTap,
      this.borderRadius,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: backgroundColor,
        borderRadius: borderRadius ?? CustomBorderRadius.allLowCircular(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: context.paddingVeryLow,
                decoration: _boxDecoration(),
                width: width ?? context.width * 0.12,
                height: height ?? context.height * 0.06,
                child: child),
            text != null
                ? Padding(
                    padding: context.paddingLow,
                    child: Text(
                      text!,
                      style: textStyle ??
                          context.textTheme.headline4!.copyWith(fontSize: 15),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        color: leftContainerColor,
        borderRadius: borderRadius ?? CustomBorderRadius.allLowCircular());
  }
}
