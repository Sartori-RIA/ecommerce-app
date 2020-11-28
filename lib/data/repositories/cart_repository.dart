import 'package:ecommerce/data/models/cart.dart';
import 'package:ecommerce/utils/dio_config.dart';

class CartRepository {
  static final CartRepository _instance = CartRepository.internal();

  factory CartRepository() => _instance;

  final _api = CartApi(DioConfig().dio);

  CartRepository.internal();

  Future<Cart> load() async {
    try {
      final cart = await _api.fetchCart();
      if (cart == null) {
        return await _api.create();
      }
      return cart;
    } catch(e) {
      return await _api.create();
    }
  }
}
