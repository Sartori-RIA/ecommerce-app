import 'dart:convert';

import 'package:ecommerce/data/models/cart.dart';
import 'package:ecommerce/utils/dio_config.dart';
import 'package:flutter/cupertino.dart';

class CartRepository {
  static final CartRepository _instance = CartRepository.internal();

  factory CartRepository() => _instance;

  CartRepository.internal();

  final _api = CartApi(DioConfig().dio);

  Future<Cart> load() async {
    try {
      var data = await _api.fetchCart();
      if (data == null) {
        data = await _api.create();
      }
      final decoded = json.decode(data.data);
      return Cart.fromJson(decoded["data"]);
    } catch (e) {
      final data = await _api.create();
      final decoded = json.decode(data.data);
      return Cart.fromJson(decoded["data"]);
    }
  }

  Future<Cart> addItem({@required int itemId, @required int quantity}) async {
    final data =
        await _api.addItem({"variant_id": itemId, "quantity": quantity});
    final decoded = json.decode(data.data);
    return Cart.fromJson(decoded["data"]);
  }

  Future<Cart> removeItem(int lineItemId) async {
    final data = await _api.removeItem(lineItemId.toString());
    final decoded = json.decode(data.data);
    return Cart.fromJson(decoded["data"]);
  }

  Future<Cart> setQuantity(
      {@required String lineItemId, @required int quantity}) async {
    final data =
        await _api.addItem({"line_item_id": lineItemId, "quantity": quantity});
    final decoded = json.decode(data.data);
    return Cart.fromJson(decoded["data"]);
  }

  Future<Cart> empty() async {
    final data = await _api.empty();
    final decoded = json.decode(data.data);
    return Cart.fromJson(decoded["data"]);
  }
}
