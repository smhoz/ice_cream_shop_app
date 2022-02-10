import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';

class PriceButton extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final Icon? icon;
  final double? iconSize;
  final Widget? child;
  final VoidCallback? onTap;
  final MainAxisAlignment? mainAxisAlignment;
  const PriceButton(
      {Key? key,
      this.text,
      this.mainAxisAlignment,
      this.onTap,
      this.iconSize,
      this.icon,
      this.child,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            icon ??
                Icon(
                  Icons.attach_money,
                  color: context.themeColor.primary,
                  size: iconSize,
                ),
            Text(text ?? "",
                style: textStyle ??
                    context.textTheme.bodyText1!.copyWith(fontSize: 18))
          ],
        ),
        if (child != null) ...[
          GestureDetector(
            onTap: onTap,
            child: child,
          )
        ]
      ],
    );
  }
}
