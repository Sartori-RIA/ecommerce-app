import 'package:ecommerce/data/models/product.dart';
import 'package:ecommerce/data/stores/cart_store.dart';
import 'package:ecommerce/data/stores/wish_list_store.dart';
import 'package:ecommerce/pages/products/product_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({@required this.product});

  @override
  Widget build(BuildContext context) {
    final _store = Provider.of<CartStore>(context);
    final _wishListStore = Provider.of<WishListStore>(context);
    return product == null
        ? Container()
        : GestureDetector(
            onTap: () {
              _show(context);
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        product.master.images.isEmpty
                            ? Image.asset(
                                "assets/images/no-image.png",
                                height: 80,
                              )
                            : Image.network(product.images[0].pdpThumbnailUrl),
                        IconButton(
                            icon: Icon(CupertinoIcons.heart),
                            iconSize: 20,
                            onPressed: () => {})
                      ],
                    ),
                    Text(product.name),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "RS ${product.displayPrice}",
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            icon: Icon(Icons.add_shopping_cart),
                            onPressed: () {
                              _store.addItem(product.id);
                            })
                      ],
                    )
                  ],
                ),
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
