import 'package:ecommerce/data/models/product.dart';
import 'package:ecommerce/data/repositories/product_repository.dart';
import 'package:mobx/mobx.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStore with _$ProductStore;

abstract class _ProductStore with Store {
  @observable
  ObservableList<Product> products = ObservableList.of([]);

  @observable
  int total = 0;
  @observable
  bool loading;
  @observable
  int page = 1;

  @observable
  int pages = 1;

  final _repository = ProductRepository();

  @action
  Future<void> load(nextPage) async {
    try {
      loading = true;
      final response = await _repository.fetchAll(nextPage);
      total = response.totalCount;
      page = response.currentPage;
      pages = response.pages;
      response.products.forEach((element) => products.add(element));
    } finally {
      loading = false;
    }
  }
}
