import 'package:ecommerce/data/stores/cart_store.dart';
import 'package:ecommerce/ui/buttons/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  CartStore _store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _store = Provider.of<CartStore>(context);
    _store.loadCart();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30, top: 30),
                    child: Center(
                      child: Text(
                        FlutterI18n.translate(context, "pages.cart.title"),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ),
                  ..._store.items,
                  Divider(),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            FlutterI18n.translate(context, "pages.cart.total")),
                        Text(FlutterI18n.translate(
                            context, "pages.product.price", translationParams: {
                          "price": _store.cart?.attributes?.total
                        })),
                      ]),
                  RoundedButton(
                    onPressed: () {},
                    text: FlutterI18n.translate(context, "pages.cart.buttons"),
                    bgColor: Theme.of(context).accentColor,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ));
  }
}
