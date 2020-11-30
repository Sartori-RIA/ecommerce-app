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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: ListView(
          children: [
            product.master.images.isEmpty
                ? Image.asset(
                    "assets/images/no-image.png",
                    height: 100,
                  )
                : Image.network(product.images[0].pdpThumbnailUrl),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "R\$ ${product.displayPrice}",
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      _store.addItem(product.id);
                    })
              ],
            ),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}
