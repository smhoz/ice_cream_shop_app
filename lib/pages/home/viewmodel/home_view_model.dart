import 'package:flutter/material.dart';
import '../../../core/init/mixin/message_mixin.dart';
import '../model/popular_ice_cream.dart';
import '../model/product_model.dart';
import '../model/top_item.dart';
import '../service/store_service.dart';

class HomeViewModel extends ChangeNotifier with MessageNotifierMixin {
  final StoreService storeService = StoreService.instance;
  bool isLoading = false;
  final List<Product> products = [];
  final List<PopularIceCream> populerIceCreams = [];
  final List<TopItem> topItems = [];

  HomeViewModel() {
    getTopFlavours();
    getPopularIceCreams();
    getTopItems();
  }

  getTopFlavours() async {
    changeIsLoading();
    final items = await storeService.getTopFlavours();
    changeIsLoading();

    if (_checkItems(items)) {
      products.addAll(items);
    }
  }

  getPopularIceCreams() async {
    changeIsLoading();
    final items = await storeService.getPopularIceCreams();
    changeIsLoading();
    if (_checkItems(items)) {
      populerIceCreams.addAll(items);
    }
  }

  void getTopItems() async {
    changeIsLoading();
    final items = await storeService.getTopItems();
    changeIsLoading();
    if (_checkItems(items)) {
      topItems.addAll(items);
    }
  }

  bool _checkItems(dynamic items) {
    if (items is List) {
      return true;
    } else {
      notifyError(items);
      return false;
    }
  }

  void changeIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
