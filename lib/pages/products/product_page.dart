import 'package:ecommerce/data/models/product.dart';
import 'package:ecommerce/data/stores/cart_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  ProductPage({@required this.product});

  @override
  Widget build(BuildContext context) {
    final _store = Provider.of<CartStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: ListView(
        children: [
          Text(product.description),
          Text(product.displayPrice),
          IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                _store.addItem(product.id);
              })
        ],
      ),
    );
  }
}
