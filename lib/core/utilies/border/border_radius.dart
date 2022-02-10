import 'package:flutter/cupertino.dart';

class CustomBorderRadius extends BorderRadius {
  CustomBorderRadius.allVeryLowCircular() : super.circular(4);
  CustomBorderRadius.allLowCircular() : super.circular(8);
  CustomBorderRadius.allMediumCircular() : super.circular(16);

  const CustomBorderRadius.onlyBottomLeftCircular()
      : super.only(bottomLeft: const Radius.circular(64));

  const CustomBorderRadius.onlyRightCircular()
      : super.only(
            topRight: const Radius.circular(8),
            bottomRight: const Radius.circular(8));

  const CustomBorderRadius.onlyLeftCircular()
      : super.only(
            topLeft: const Radius.circular(8),
            bottomLeft: const Radius.circular(8));
}
