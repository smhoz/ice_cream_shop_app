import 'package:flutter/material.dart';
import '../../../core/components/center/center_circular_progress.dart';
import '../../../core/components/center/center_error.dart';
import '../../../core/components/image/network_image_with_circular.dart';
import '../../../core/components/text/title_text_with_container.dart';
import '../../_product/_widgets/button/circle_add_button.dart';
import '../model/popular_ice_cream.dart';
import '../model/product_model.dart';
import '../model/top_item.dart';
import '../viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/extensions/string_extension.dart';
import '../../../presentation/ice_cream_shop_app_icons.dart';
import '../../_product/_widgets/button/price_button.dart';
import '../../_product/_widgets/search/search_field_with_filter.dart';
import 'prices/prices_page.dart';
import 'topflavours/top_flavours.dart';
import 'topitem/top_item_widget.dart';

import 'appbar/transparent_app_bar.dart';
import 'popularicecream/popular_ice_cream_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const CenterCircularProgress();
          } else if (viewModel.error != null) {
            return CenterError(
              error: viewModel.error,
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _searchField(context),
                  _topFlavours(context, viewModel.products),
                  _popularIceCreams(context, viewModel.populerIceCreams),
                  _topItems(context, viewModel.topItems),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  TransparentAppBar _appbar(BuildContext context) {
    return TransparentAppBar(
        title: "Hey Emma",
        subTitle: "What flavor do you like to eat ?",
        child: CircleAvatar(
          radius: context.height * 0.035,
          backgroundColor: context.themeColor.primary,
          backgroundImage: AssetImage(
            "girl_avatar".toAvatarsPng,
          ),
        ));
  }

  TopItemWidget _topItems(BuildContext context, List<TopItem> topItems) {
    return TopItemWidget(
      height: context.height * 0.3,
      topItems: topItems,
    );
  }

  PopularIceCreamWidget _popularIceCreams(
      BuildContext context, List<PopularIceCream> popularIceCreams) {
    double iceCreamHeight = context.height * 0.06;
    return PopularIceCreamWidget(
      height: iceCreamHeight,
      popularIceCreams: popularIceCreams,
    );
  }

  Padding _searchField(BuildContext context) {
    return Padding(
      padding: context.paddingMedium,
      child: SearchFieldWithFilter(
        onTap: () {},
        filterIcon: IceCreamShopApp.sliders,
      ),
    );
  }

  Widget _topFlavours(BuildContext context, List<Product> products) {
    return TitleTextWithContainer(
      text: "Top Flavours",
      child: SizedBox(
        height: context.height * 0.2,
        child: ListView.builder(
          itemCount: products.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            Product _product = products[index];
            return _topFlavoursWidget(_product, context);
          },
        ),
      ),
    );
  }

  TopFlavours _topFlavoursWidget(Product _product, BuildContext context) {
    return TopFlavours(
        child: NetworkImageWithCircular(imageURL: _product.imageURL),
        text: _product.productName,
        weight: _product.weight,
        rating: _product.rating,
        priceButton: _priceButton(context, _product));
  }

  PriceButton _priceButton(BuildContext context, Product product) {
    return PriceButton(
      onTap: () {
        NavigationService.instance.navigateToPage(
            path: NavigationConstants.PRICES_PAGE,
            data: PricesPage(
              product: product,
            ));
      },
      text: product.price,
      child: const CircleAddButton(),
    );
  }
}
