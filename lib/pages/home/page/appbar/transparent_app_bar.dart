import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';

class TransparentAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final String? subTitle;
  final Color? color;
  final Widget child;
  final Color? backgroundColor;

  const TransparentAppBar(
      {Key? key, this.subTitle,this.backgroundColor, this.title, this.color, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:backgroundColor ?? Colors.transparent,
      elevation: 0,
      title: _titleAndSubtitle(context, title, subTitle),
      actions: [
        Padding(
          padding: context.onlyRightPaddingMedium,
          child: child,
        )
      ],
    );
  }

  Column _titleAndSubtitle(
      BuildContext context, String? title, String? subTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? "",
          style: context.textTheme.bodyText1,
        ),
        SizedBox(
          height: context.veryLowHeight,
        ),
        Text(
          subTitle ?? "",
          style: context.textTheme.headline5!
              .copyWith(color: context.themeColor.secondaryVariant),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
