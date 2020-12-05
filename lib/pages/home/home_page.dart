import 'package:badges/badges.dart';
import 'package:ecommerce/data/stores/cart_store.dart';
import 'package:ecommerce/data/stores/home_store.dart';
import 'package:ecommerce/pages/cart/cart_page.dart';
import 'package:ecommerce/pages/products/products_page.dart';
import 'package:ecommerce/pages/profile/profile_page.dart';
import 'package:ecommerce/pages/wishlist/wish_list_form.dart';
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
    final _cartStore = Provider.of<CartStore>(context);
    _cartStore.loadCart();
    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(FlutterI18n.translate(context, "pages.home.title")),
          actions: [
            _store.currentIndex == 2
                ? IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => _cartStore.empty())
                : Container()
          ],
        ),
        body: _children[_store.currentIndex],
        floatingActionButton: _store.currentIndex == 1
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      fullscreenDialog: true, builder: (_) => WishListForm()));
                },
                child: Icon(Icons.add),
              )
            : null,
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
                icon: _cartStore.totalItems < 1
                    ? Icon(Icons.shopping_cart)
                    : Badge(
                        child: Icon(Icons.shopping_cart),
                        badgeContent: Text("${_cartStore.totalItems}"),
                      ),
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
