import 'package:ecommerce/data/models/order.dart';
import 'package:ecommerce/data/models/spree_response.dart';
import 'package:ecommerce/utils/dio_config.dart';

class OrderRepository {
  static final OrderRepository _instance = OrderRepository.internal();

  factory OrderRepository() => _instance;

  final _api = OrderApi(DioConfig().dio);

  OrderRepository.internal();

  Future<Order> findOrder(String orderNumber) async =>
      await _api.findOrder(orderNumber);

  Future<OrderPaginated> all() async => await _api.all();
}
