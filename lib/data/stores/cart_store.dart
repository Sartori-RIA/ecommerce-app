import 'package:ecommerce/data/models/cart.dart';
import 'package:ecommerce/data/models/order.dart';
import 'package:ecommerce/data/repositories/cart_repository.dart';
import 'package:ecommerce/data/repositories/order_repository.dart';
import 'package:ecommerce/pages/cart/widgets/cart_item.dart';
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

  @observable
  int totalItems = 0;

  final _repository = CartRepository();
  final _orderRepository = OrderRepository();

  @action
  Future<void> loadCart() async {
    try {
      loading = true;
      cart = await _repository.load();
      final res = await _orderRepository.findOrder(cart.attributes.number);
      order = res;
      totalItems = order.totalQuantity;
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> addItem(int itemId) async {
    try {
      loading = true;
      cart = await _repository.addItem(quantity: 1, itemId: itemId);
      order = await _orderRepository.findOrder(cart.attributes.number);
      totalItems = order.totalQuantity;
    } catch (e, s) {
      print(e);
      print(s);
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> setQuantity(
      {@required int quantity, @required String lineItemId}) async {
    cart = await _repository.setQuantity(
        quantity: quantity, lineItemId: lineItemId);
    order = await _orderRepository.findOrder(cart.attributes.number);
    totalItems = order.totalQuantity;
  }

  @action
  Future<void> remove(int lineItemId) async {
    cart = await _repository.removeItem(lineItemId);
    order = await _orderRepository.findOrder(cart.attributes.number);
    totalItems = order.totalQuantity;
  }

  @action
  Future<void> empty() async {
    cart = await _repository.empty();
    order = await _orderRepository.findOrder(cart.attributes.number);
    totalItems = order.totalQuantity;
  }

  @computed
  List<Widget> get items => (order == null || order.lineItems.isEmpty)
      ? [Container()]
      : order.lineItems.map((e) => CartItem(item: e)).toList();
}
