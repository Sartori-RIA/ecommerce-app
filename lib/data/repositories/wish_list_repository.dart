import 'package:ecommerce/data/models/spree_response.dart';
import 'package:ecommerce/data/models/wish_list.dart';
import 'package:ecommerce/utils/dio_config.dart';
import 'package:flutter/cupertino.dart';

class WishListRepository {
  static final WishListRepository _instance = WishListRepository.internal();

  factory WishListRepository() => _instance;

  WishListRepository.internal();

  final _api = WishListApi(DioConfig().dio);

  Future<WishListsPaginated> fetch({int page = 1}) async =>
      await _api.fetch(page.toString());

  Future<WishList> create(WishList data) async =>
      await _api.create({"wishlist": data});

  Future<WishList> addProduct(
          {@required int wishListId, @required int productId}) async =>
      await _api.addProduct({
        "wished_product": {"wishlist_id": wishListId, "variant_id": productId}
      });

  Future<WishList> removeProduct(int wishedProductId) async =>
      await _api.deleteProduct(wishedProductId.toString());

  Future delete(int id) async => await _api.delete(id.toString());
}
