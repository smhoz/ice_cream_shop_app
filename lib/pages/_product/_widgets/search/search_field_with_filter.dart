import 'package:flutter/material.dart';

import '../../../../core/components/search/search_field.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utilies/border/border_radius.dart';

class SearchFieldWithFilter extends StatelessWidget {
  final String? hintText;
  final String? filterText;
  final IconData filterIcon;
  final VoidCallback? onTap;
  const SearchFieldWithFilter(
      {Key? key,
      this.hintText,
      this.onTap,
      required this.filterIcon,
      this.filterText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: context.onlyRightPaddingMedium,
          child: SearchField(
            hintText: hintText ?? "Search",
            iconOnTap: () {},
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: _filterWidget(context),
        ),
      ],
    );
  }

  Widget _filterWidget(BuildContext context) {
    return Padding(
      padding: context.paddingVerticalMedium,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: context.width * 0.27,
          decoration: _filterWidgetBoxDecoration(context),
          child: Padding(
            padding: context.symetricPadding,
            child: _filterWidgetTextAndIcon(context),
          ),
        ),
      ),
    );
  }

  Row _filterWidgetTextAndIcon(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          filterIcon,
        ),
        Text(
          filterText ?? "Filter",
          style: context.textTheme.headline5!
              .copyWith(color: context.themeColor.secondary),
        ),
      ],
    );
  }

  BoxDecoration _filterWidgetBoxDecoration(BuildContext context) {
    return BoxDecoration(
        color: context.themeColor.primary,
        borderRadius: CustomBorderRadius.allMediumCircular());
  }
}
