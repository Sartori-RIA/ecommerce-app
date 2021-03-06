import 'package:ecommerce/data/stores/account_store.dart';
import 'package:ecommerce/data/stores/auth_store.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/loaders/decoders/yaml_decode_strategy.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'data/stores/cart_store.dart';
import 'data/stores/home_store.dart';
import 'data/stores/product_store.dart';
import 'routes.dart';
import 'ui/theme.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (ctx, snapshot) => MultiProvider(
            providers: [
              Provider<AuthStore>(create: (_) => AuthStore()),
              Provider<CartStore>(create: (_) => CartStore()),
              Provider<ProductStore>(create: (_) => ProductStore()),
              Provider<HomeStore>(create: (_) => HomeStore()),
              Provider<AccountStore>(create: (_) => AccountStore()),
            ],
            child: MaterialApp(
              theme: theme,
              debugShowCheckedModeBanner: false,
              navigatorObservers: [
                FirebaseAnalyticsObserver(analytics: analytics),
              ],
              supportedLocales: [Locale("pt", "BR")],
              routes: ecommerceRoutes,
              initialRoute: "/sign_in",
              localizationsDelegates: [
                FlutterI18nDelegate(
                  translationLoader: FileTranslationLoader(
                      useCountryCode: false,
                      decodeStrategies: [YamlDecodeStrategy()],
                      forcedLocale: Locale('pt')),
                ),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
            ),
          ));
}
