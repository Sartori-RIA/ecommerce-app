import 'package:ecommerce/data/models/cart.dart';
import 'package:ecommerce/data/repositories/cart_repository.dart';
import 'package:mobx/mobx.dart';

part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {

  @observable
  bool loading = false;
  @observable
  Cart cart;

  final _repository = CartRepository();

  @action
  Future<void> loadCart() async {
    try {
      loading = true;
      cart = await _repository.load();
    } finally {
      loading = false;
    }
  }
}
