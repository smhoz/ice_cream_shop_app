import 'package:flutter/material.dart';

import '../../../../core/components/button/gradient_color_button.dart';
import '../../../../core/init/theme/colors/custom_colors.dart';
import '../../../../core/utilies/border/border_radius.dart';

class GradientColorWithIconButton extends StatelessWidget {
  final IconData? iconData;
  final BorderRadius? borderRadius;
  final Gradient? gradientColor;
  final VoidCallback? onTap;
  const GradientColorWithIconButton(
      {Key? key,
      this.iconData,
      this.onTap,
      this.borderRadius,
      this.gradientColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientColorButton(
      child: Icon(
        iconData ?? Icons.add,
        size: 24,
      ),
      borderRadius: borderRadius ?? CustomBorderRadius.allVeryLowCircular(),
      gradient:
          gradientColor ?? CustomColors.instance.buttonLinearGradientColor,
      onPressed: onTap,
    );
  }
}
