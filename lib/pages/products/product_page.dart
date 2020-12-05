import 'package:ecommerce/data/models/product.dart';
import 'package:ecommerce/data/stores/cart_store.dart';
import 'package:flutter/cupertino.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                product.master.images.isEmpty
                    ? Image.asset(
                        "assets/images/no-image.png",
                        height: 200,
                      )
                    : Image.network(product.images[0].pdpThumbnailUrl),
                IconButton(
                    icon: Icon(CupertinoIcons.heart),
                    iconSize: 30,
                    onPressed: () {})
              ],
            ),
            Text(
              product.name,
              style: Theme.of(context).textTheme.headline6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "R\$ ${product.displayPrice}",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      icon: Icon(Icons.add_shopping_cart),
                      iconSize: 40,
                      onPressed: () {
                        _store.addItem(product.id);
                      })
                ],
              ),
            ),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}
