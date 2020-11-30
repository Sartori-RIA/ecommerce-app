import 'package:ecommerce/data/models/product.dart';
import 'package:ecommerce/pages/products/product_page.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({@required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _show(context);
      },
      child: Card(
        child: Column(
          children: [Text(product.name)],
        ),
      ),
    );
  }

  void _show(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => ProductPage(
              product: product,
            )));
  }
}
