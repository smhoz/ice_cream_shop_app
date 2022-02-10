import 'package:flutter/material.dart';
import '../../../../core/components/image/network_image_with_circular.dart';
import '../../../../core/init/theme/colors/custom_colors.dart';
import '../../../../core/utilies/border/border_radius.dart';
import '../../../_product/_widgets/button/circle_add_button.dart';
import '../../../_product/_widgets/button/price_button.dart';
import '../../model/top_item.dart';

import '../../../../core/components/text/title_text_with_container.dart';
import '../../../../core/extensions/context_extension.dart';

class TopItemWidget extends StatelessWidget {
  final double? height;
  final List<TopItem> topItems;
  const TopItemWidget({Key? key, required this.topItems, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TitleTextWithContainer(
        text: "Top Item",
        child: Padding(
            padding: context.paddingMedium,
            child: SizedBox(
              height: height ?? context.height * 0.3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topItems.length,
                itemBuilder: (context, index) {
                  TopItem _topItem = topItems[index];
                  Color _color = _checkColor(index);
                  return Padding(
                    padding: context.onlyRightPaddingMedium,
                    child: _topItemWidget(context, _color, _topItem),
                  );
                },
              ),
            )));
  }

  Container _topItemWidget(
      BuildContext context, Color _color, TopItem _topItem) {
    return Container(
      width: context.width * 0.44,
      decoration: _boxDecoration(_color),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _topWidget(
              context, NetworkImageWithCircular(imageURL: _topItem.imageURL)),
          _texts(context, _topItem.title, _topItem.subTitle),
          _priceButton(context, _topItem.price),
        ],
      ),
    );
  }

  BoxDecoration _boxDecoration(Color color) {
    return BoxDecoration(
        color: color, borderRadius: CustomBorderRadius.allMediumCircular());
  }

  Container _topWidget(BuildContext context, Widget child) {
    return Container(
        width: context.width * 0.2, alignment: Alignment.center, child: child);
  }

  Widget _texts(BuildContext context, String? title, String? subTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? "",
          style: context.textTheme.bodyText2!.copyWith(fontSize: 18),
        ),
        SizedBox(
          height: context.veryLowHeight,
        ),
        Text(
          subTitle ?? "",
          style: context.textTheme.headline5!.copyWith(
              color: context.themeColor.secondaryVariant, fontSize: 14),
        ),
      ],
    );
  }

  PriceButton _priceButton(BuildContext context, String? price) {
    return PriceButton(
      onTap: () {
        /* NavigationService.instance.navigateToPage(
            path: NavigationConstants.PRICES_PAGE, data: const PricesPage());*/
      },
      text: price,
      child: const CircleAddButton(),
    );
  }

  Color _checkColor(int index) {
    if (index % 2 == 0) {
      return CustomColors.instance.topItemColor1;
    } else {
      return CustomColors.instance.topItemColor2;
    }
  }
}
