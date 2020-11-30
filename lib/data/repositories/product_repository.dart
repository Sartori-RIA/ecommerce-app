import 'package:ecommerce/data/models/product.dart';
import 'package:ecommerce/data/models/spree_response.dart';
import 'package:ecommerce/utils/dio_config.dart';

class ProductRepository {
  static final ProductRepository _instance = ProductRepository.internal();

  factory ProductRepository() => _instance;

  final _api = ProductApi(DioConfig().dio);

  ProductRepository.internal();

  Future<ProductPaginated> fetchAll(int page) async {
    return _api.products(page.toString());
  }

  Future<Product> fetchDetails(int id) async {
    return _api.productDetail(id.toString());
  }
}
