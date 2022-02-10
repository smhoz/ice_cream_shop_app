import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';

class CenterError extends StatelessWidget {
  final String? error;
  final TextStyle? textStyle;
  final Widget? child;
  const CenterError({Key? key, this.error, this.textStyle, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          error ?? "Error",
          style: textStyle ?? context.textTheme.bodyText1,
        ),
        child ?? Container(),
      ],
    );
  }
}
