import 'package:ecommerce/data/stores/wish_list_store.dart';
import 'package:ecommerce/pages/wishlist/widgets/wish_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

class WishListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _store = Provider.of<WishListStore>(context);
    _store.load();
    return Observer(
        builder: (_) => LoadingOverlay(
            isLoading: _store.loading,
            child: Container(
              child: ListView.builder(
                  itemCount: _store.wishLists.length,
                  itemBuilder: (_, index) {
                    if ((index + 1) >= _store.wishLists.length) {
                      _store.load(nextPage: _store.page + 1);
                      return Container();
                    } else
                      return Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: WishListCard(
                            wishList: _store.wishLists[index],
                          ));
                  }),
            )));
  }
}
