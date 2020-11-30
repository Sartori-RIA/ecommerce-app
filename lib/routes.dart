import 'package:flutter/material.dart';

import 'pages/auth/sign_in_page.dart';
import 'pages/auth/sign_up_page.dart';
import 'pages/home/home_page.dart';
import 'pages/orders/order_page.dart';
import 'pages/orders/orders_page.dart';
import 'pages/wishlist/wisht_list_page.dart';

final Map<String, WidgetBuilder> ecommerceRoutes = {
  '/sign_in': (_) => SignInPage(),
  '/sign_up': (_) => SignUpPage(),
  '/home': (_) => HomePage(),
  '/orders': (_) => OrdersPage(),
  '/orders/:id': (_) => OrderPage(),
  '/wish_list': (_) => WishListPage(),
};
