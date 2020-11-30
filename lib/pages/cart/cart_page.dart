import 'package:ecommerce/data/stores/cart_store.dart';
import 'package:ecommerce/pages/cart/widgets/cart_item.dart';
import 'package:ecommerce/ui/buttons/rounded_button.dart';
import 'package:flutter/material.dart';
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
    return Container(
      child: Observer(
          builder: (_) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ListView(
                  children: [
                    Center(
                      child: Text(
                        "Meu carrinho de rituais e pactos",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    ..._store?.order?.lineItems
                        ?.map((e) => CartItem(item: e))
                        ?.toList(),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("CEP"), Text("85020-530")],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("TOTAL"),
                        Text("RS ${_store.cart?.attributes?.total}"),
                      ],
                    ),
                    RoundedButton(
                      onPressed: () {},
                      text: "COMPRAR",
                      bgColor: Theme.of(context).accentColor,
                      textColor: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: RaisedButton(
                          onPressed: () {
                            _store.empty();
                          },
                          child: Text("LIMPAR")),
                    ),
                  ],
                ),
              )),
    );
  }
}
