import 'package:ecommerce/data/models/wish_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class WishListCard extends StatelessWidget {
  final WishList wishList;

  WishListCard({@required this.wishList});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      child: Container(
        child: ListTile(
          title: Text(wishList.name),
        ),
      ),
      secondaryActions: [
        IconSlideAction(
          caption: 'EDIT',
          color: Theme.of(context).primaryColor,
          icon: Icons.edit,
          onTap: () => {
          },
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Theme.of(context).accentColor,
          icon: Icons.delete,
          onTap: () => {
          },
        ),
      ],
    );
  }
}
