import 'package:ecommerce/data/stores/product_store.dart';
import 'package:ecommerce/pages/products/widgets/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  ProductStore _store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _store = Provider.of<ProductStore>(context);
    _store.load();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => LoadingOverlay(
            isLoading: _store.loading,
            child: GridView.builder(
                itemCount: _store.total,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (_, index) =>
                    ProductCard(product: _store.products[index]))));
  }
}
