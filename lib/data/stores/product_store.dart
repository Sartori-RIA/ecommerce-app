import 'package:ecommerce/data/models/product.dart';
import 'package:ecommerce/data/repositories/product_repository.dart';
import 'package:mobx/mobx.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {

  @observable
  ObservableList<Product> products = ObservableList.of([]);

  @observable
  bool loading;

  final _repository = ProductRepository();

  @action
  Future<void> load() async {
    try {
      loading = true;
      final response = await _repository.fetchAll();
      response.products.forEach((element) => products.add(element));
    } finally {
      loading = false;
    }
  }
}
