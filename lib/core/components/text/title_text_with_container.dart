import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';

class TitleTextWithContainer extends StatelessWidget {
  final String text;
  final Widget child;
  final EdgeInsets? padding;
  final TextStyle? style;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;

  const TitleTextWithContainer(
      {Key? key,
      required this.text,
      required this.child,
      this.padding,
      this.style,
      this.crossAxisAlignment,
      this.mainAxisAlignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        Padding(
          padding: padding ?? context.paddingHorizontalMedium,
          child: Text(
            text,
            style: style ?? context.textTheme.bodyText2,
          ),
        ),
        child,
      ],
    );
  }
}
