import 'package:flutter/material.dart';
import '../../../../core/components/button/two_color_button.dart';
import '../../../../core/components/image/network_image_with_circular.dart';
import '../../../../core/init/theme/colors/custom_colors.dart';
import '../../model/popular_ice_cream.dart';

import '../../../../core/components/text/title_text_with_container.dart';
import '../../../../core/extensions/context_extension.dart';

class PopularIceCreamWidget extends StatelessWidget {
  final double? height;
  final List<PopularIceCream> popularIceCreams;
  const PopularIceCreamWidget(
      {Key? key, required this.popularIceCreams, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TitleTextWithContainer(
        text: "Popular Ice Cream",
        child: Padding(
          padding: context.paddingMedium,
          child: SizedBox(
            height: height ?? context.width * 0.12,
            child: ListView.builder(
              itemCount: popularIceCreams.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                PopularIceCream _popularIceCream = popularIceCreams[index];
                List<Color> colors = _checkColor(index);
                Color backgroundColor = colors[0];
                Color leftContainerColor = colors[1];
                return Padding(
                  padding: context.onlyRightPaddingMedium,
                  child: _twoColorButton(context, _popularIceCream,
                      backgroundColor, leftContainerColor),
                );
              },
            ),
          ),
        ));
  }

  TwoColorButton _twoColorButton(
      BuildContext context,
      PopularIceCream _popularIceCream,
      Color backgroundColor,
      Color leftContainerColor) {
    return TwoColorButton(
      child: Padding(
        padding: context.paddingVeryLow,
        child: NetworkImageWithCircular(imageURL: _popularIceCream.imageURL),
      ),
      text: _popularIceCream.productName,
      backgroundColor: backgroundColor,
      leftContainerColor: leftContainerColor,
    );
  }

  List<Color> _checkColor(int index) {
    if (index % 2 == 1) {
      return [
        CustomColors.instance.neopolitianBackgroundColor,
        CustomColors.instance.neopolitionImageColor
      ];
    } else if (index % 2 == 0 && index != 0) {
      return [
        CustomColors.instance.cookieBackgroundColor,
        CustomColors.instance.cookieImageColor
      ];
    }

    return [
      CustomColors.instance.vaniliaBackgroundColor,
      CustomColors.instance.vaniliaImageColor
    ];
  }
}
/* 

 List<Widget> popularIceCreams(double height) => [
        TwoColorButton(
          height: height,
          child: Image.asset("cup_ice_cream".toIcecreamsPng),
          text: "Vanilia",
          backgroundColor: CustomColors.instance.vaniliaBackgroundColor,
          leftContainerColor: CustomColors.instance.vaniliaImageColor,
        ),
        TwoColorButton(
          height: height,
          child: Image.asset("neopolitian_ice_cream".toIcecreamsPng),
          text: "Neopolitian",
          backgroundColor: CustomColors.instance.neopolitianBackgroundColor,
          leftContainerColor: CustomColors.instance.neopolitionImageColor,
        ),
        TwoColorButton(
          child: Image.asset("cookie_ice_cream".toIcecreamsPng),
          text: "Cookie",
          backgroundColor: CustomColors.instance.cookieBackgroundColor,
          leftContainerColor: CustomColors.instance.cookieImageColor,
        ),
      ];*/ 