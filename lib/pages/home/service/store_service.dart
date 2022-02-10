import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/constants/store/store_service_constants.dart';
import '../model/popular_ice_cream.dart';
import '../model/product_model.dart';
import '../model/top_item.dart';
import 'IStoreService.dart';

class StoreService extends IStoreService {
  StoreService._privateConstructor();
  static final StoreService instance = StoreService._privateConstructor();

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<dynamic> getTopFlavours() async {
    final List<Product> products = [];
    final response =
        await getFromFirebase(StoreServiceConstants.PRODUCT_COLLECTION);
    if (response is List) {
      for (DocumentChange<Map<String, dynamic>> element in response) {
        final product = Product.fromJson(element.doc.data());
        products.add(product);
      }
      return products;
    } else {
      return response;
    }
  }

  Future<dynamic> getPopularIceCreams() async {
    final List<PopularIceCream> popularIceCreams = [];

    final response =
        await getFromFirebase(StoreServiceConstants.POPULAR_ICE_CREAMS);
    if (response is List) {
      for (DocumentChange<Map<String, dynamic>> element in response) {
        final popularIceCream = PopularIceCream.fromJson(element.doc.data());
        popularIceCreams.add(popularIceCream);
      }
      return popularIceCreams;
    } else {
      return response;
    }
  }

  Future<dynamic> getTopItems() async {
    final List<TopItem> topItems = [];
    final response = await getFromFirebase(StoreServiceConstants.TOP_ITEMS);
    if (response is List) {
      for (DocumentChange<Map<String, dynamic>> element in response) {
        final topItem = TopItem.fromJson(element.doc.data());
        topItems.add(topItem);
      }
      return topItems;
    } else {
      return response;
    }
  }

  @override
  Future<dynamic> getFromFirebase(String collectionPath) async {
    try {
      return (await firebaseFirestore.collection(collectionPath).get())
          .docChanges;
    } on FirebaseException catch (exception) {
      return exception;
    }
  }
}
