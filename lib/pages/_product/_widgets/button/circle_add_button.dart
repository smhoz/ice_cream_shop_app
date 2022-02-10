import 'package:flutter/material.dart';
import '../../../../core/extensions/context_extension.dart';
class CircleAddButton extends StatelessWidget {
  const CircleAddButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Material(
        color: context.themeColor.primary,
        type: MaterialType.circle,
        elevation: 4,
        child: Padding(
          padding: context.paddingVeryLow,
          child: Icon(
            Icons.add,
            color: context.theme.iconTheme.color,
          ),
        ),
      );
  }
}