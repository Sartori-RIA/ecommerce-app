import 'package:ecommerce/data/models/cart.dart';
import 'package:ecommerce/data/models/order.dart';
import 'package:ecommerce/data/repositories/cart_repository.dart';
import 'package:ecommerce/data/repositories/order_repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  @observable
  bool loading = false;

  @observable
  Cart cart;

  @observable
  Order order;

  final _repository = CartRepository();
  final _orderRepository = OrderRepository();

  @action
  Future<void> loadCart() async {
    try {
      loading = true;
      cart = await _repository.load();
      final res = await _orderRepository.findOrder(cart.attributes.number);
      order = res;
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> addItem(int itemId) async {
    cart = await _repository.addItem(quantity: 1, itemId: itemId);
    order = await _orderRepository.findOrder(cart.attributes.number);
  }

  @action
  Future<void> setQuantity(
      {@required int quantity, @required String lineItemId}) async {
    cart = await _repository.setQuantity(
        quantity: quantity, lineItemId: lineItemId);
    order = await _orderRepository.findOrder(cart.attributes.number);

  }

  @action
  Future<void> remove(int lineItemId) async {
    cart = await _repository.removeItem(lineItemId);
    order = await _orderRepository.findOrder(cart.attributes.number);
  }

  @action
  Future<void> empty() async {
    cart = await _repository.empty();
    order = await _orderRepository.findOrder(cart.attributes.number);
  }
}