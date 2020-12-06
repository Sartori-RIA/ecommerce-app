import 'package:ecommerce/data/models/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class CartItem extends StatelessWidget {
  OrderLineItem item;

  CartItem({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                item.variant.images.isEmpty
                    ? Image.asset(
                        "assets/images/no-image.png",
                        height: 100,
                      )
                    : Image.network(item.variant.images[0].pdpThumbnailUrl),
                Text("${item.variant.name}")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(FlutterI18n.translate(context, "pages.cart.qnt",
                    translationParams: {"qnt": item.quantity.toString()})),
                Text("${item.total}")
              ],
            )
          ],
        ),
      ),
    );
  }
}
