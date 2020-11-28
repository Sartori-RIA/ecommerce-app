import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/loaders/decoders/yaml_decode_strategy.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'pages/home/home_page.dart';
import 'ui/theme.dart';
import 'routes.dart';

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
            providers: [],
            child: MaterialApp(
              theme: theme,
              debugShowCheckedModeBanner: false,
              home: HomePage(),
              navigatorObservers: [
                FirebaseAnalyticsObserver(analytics: analytics),
              ],
              supportedLocales: [Locale("pt", "BR")],
              routes: ecommerceRoutes,
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
