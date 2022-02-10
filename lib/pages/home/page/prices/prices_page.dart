import 'package:flutter/material.dart';
import '../../../../core/components/image/network_image_with_circular.dart';
import '../../model/product_model.dart';
import '../../../../core/components/button/gradient_color_button.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/init/theme/colors/custom_colors.dart';
import '../../../../core/utilies/border/border_radius.dart';
import '../../../_product/_widgets/button/gradient_color_button_with_icon.dart';
import '../../../_product/_widgets/button/price_button.dart';
import '../appbar/transparent_app_bar.dart';
import '../../../../presentation/ice_cream_shop_app_icons.dart';

class PricesPage extends StatelessWidget {
  final Product product;
  const PricesPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: Column(
        children: [
          Flexible(flex: 3, child: _image(context)),
          Flexible(
            flex: 4,
            child: Padding(
              padding: context.paddingMedium,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _title(context),
                  _reviews(context),
                  _incrementButtonAndPrices(context),
                  _description(context),
                  _addToCardButton(context)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TransparentAppBar _appbar(BuildContext context) {
    return TransparentAppBar(
        backgroundColor: context.themeColor.secondary,
        child: Icon(
          Icons.favorite_border_outlined,
          color: context.themeColor.primary,
        ));
  }

  Text _title(BuildContext context) {
    return Text(
      product.productName ?? "",
      style: context.textTheme.bodyText1,
    );
  }

  Row _reviews(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: context.height * 0.03,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              int emptyStar = (5 - product.rating!.toInt());
              Color _color = _checkColor(context, index, emptyStar);
              return Icon(
                Icons.star,
                color: _color,
              );
            },
          ),
        ),
        SizedBox(
          width: context.mediumHeight,
        ),
        _ratingAndReviewsText(context),
      ],
    );
  }

  Text _ratingAndReviewsText(BuildContext context) {
    return Text(
      product.rating.toString() + "(${product.review.toString()} Reviews)",
      style: context.textTheme.headline5!
          .copyWith(color: context.themeColor.secondaryVariant),
    );
  }

  Color _checkColor(BuildContext context, int index, int emptyStar) {
    if (index < 5 - emptyStar) {
      return context.theme.bottomAppBarColor;
    } else {
      return context.themeColor.secondaryVariant.withOpacity(0.4);
    }
  }

  Padding _incrementButtonAndPrices(BuildContext context) {
    return Padding(
      padding: context.paddingVerticalMedium,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _incrementAndDeleteButton(context),
          PriceButton(
            text: product.price,
            textStyle: context.textTheme.bodyText1!.copyWith(fontSize: 32),
            iconSize: 40,
          )
        ],
      ),
    );
  }

  Text _description(BuildContext context) {
    return Text(
      product.description ?? "",
      style: context.textTheme.headline3,
    );
  }

  GradientColorButton _addToCardButton(BuildContext context) {
    return GradientColorButton(
        onPressed: () {},
        borderRadius: CustomBorderRadius.allLowCircular(),
        width: context.width,
        child: Padding(
          padding: context.paddingMedium,
          child: Text(
            "Add To Card",
            style: context.textTheme.headline5,
          ),
        ),
        gradient: CustomColors.instance.buttonLinearGradientColor);
  }

  Row _incrementAndDeleteButton(BuildContext context) {
    return Row(
      children: [
        GradientColorWithIconButton(
          iconData: IceCreamShopApp.minus,
          onTap: () {},
        ),
        SizedBox(
          width: context.mediumHeight,
        ),
        Text(
          "2 Kg",
          style: context.textTheme.bodyText2!.copyWith(fontSize: 16),
        ),
        SizedBox(
          width: context.mediumHeight,
        ),
        GradientColorWithIconButton(
          iconData: Icons.add,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _image(BuildContext context) {
    return Container(
      width: context.width,
      decoration: BoxDecoration(
          color: context.themeColor.secondary,
          boxShadow: [
            _boxShadow(),
          ],
          borderRadius: const CustomBorderRadius.onlyBottomLeftCircular()),
      child: NetworkImageWithCircular(imageURL: product.imageURL),
    );
  }

  BoxShadow _boxShadow() {
    return BoxShadow(
        blurRadius: 2,
        color: Colors.black.withOpacity(0.2),
        offset: const Offset(0, 2));
  }
}
