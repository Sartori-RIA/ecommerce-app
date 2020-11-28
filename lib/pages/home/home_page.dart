import 'package:ecommerce/data/stores/home_store.dart';
import 'package:ecommerce/pages/cart/cart_page.dart';
import 'package:ecommerce/pages/products/products_page.dart';
import 'package:ecommerce/pages/profile/profile_page.dart';
import 'package:ecommerce/pages/wishlist/wisht_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final List<Widget> _children = [
    ProductsPage(),
    WishListPage(),
    CartPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    final _store = Provider.of<HomeStore>(context);
    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(FlutterI18n.translate(context, "pages.home.title")),
        ),
        body: _children[_store.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _store.currentIndex,
          onTap: _store.setIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black38,
                ),
                label: FlutterI18n.translate(
                    context, "pages.home.navigation.home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: FlutterI18n.translate(
                    context, "pages.home.navigation.favorite")),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: FlutterI18n.translate(
                    context, "pages.home.navigation.cart")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: FlutterI18n.translate(
                    context, "pages.home.navigation.profile")),
          ],
        ),
      ),
    );
  }
}
