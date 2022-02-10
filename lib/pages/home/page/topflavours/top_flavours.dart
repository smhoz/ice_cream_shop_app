import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/utilies/border/border_radius.dart';

class TopFlavours extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget child;
  final String? text;
  final String? weight;
  final double? rating;
  final Widget priceButton;
  const TopFlavours(
      {Key? key,
      this.height,
      required this.child,
      this.text,
      this.weight,
      this.rating,
      this.width,
      required this.priceButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Stack(
        children: [
          Padding(
            padding: context.paddingMedium,
            child: _centerRightWidget(context),
          ),
          SizedBox(
              height: context.height * 0.2,
              width: context.width * 0.50,
              child: child)
        ],
      ),
    );
  }

  Container _centerRightWidget(BuildContext context) {
    return Container(
      height: height,
      decoration: _boxDecoration(context, context.themeColor.secondary),
      child: Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          width: context.width * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_title(context), _kgAndStarRow(context), priceButton],
          ),
        ),
      ),
    );
  }

  Text _title(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: TextAlign.center,
      style: context.textTheme.bodyText1!.copyWith(fontSize: 18),
    );
  }

  Row _kgAndStarRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: context.paddingLow,
          decoration: _boxDecoration(context, context.theme.bottomAppBarColor),
          child: Text(weight ?? "", style: context.textTheme.headline4),
        ),
        Row(
          children: [
            Icon(
              Icons.star_rate,
              color: context.theme.bottomAppBarColor,
            ),
            Text(rating.toString(), style: context.textTheme.headline4)
          ],
        ),
      ],
    );
  }

  BoxDecoration _boxDecoration(BuildContext context, Color color) {
    return BoxDecoration(
        color: color, borderRadius: CustomBorderRadius.allMediumCircular());
  }
}
