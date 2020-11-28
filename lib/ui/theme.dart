import 'package:flutter/material.dart';

final Map<int, Color> colorCodes = {
    50: Color(0xFFfafafa),
    100: Color(0xFFf5f5f5),
    200: Color(0xFFeeeeee),
    300: Color(0xFFe0e0e0),
    400: Color(0xFFbdbdbd),
    500: Color(0xFF9e9e9e),
    600: Color(0xFF757575),
    700: Color(0xFF616161),
    800: Color(0xFF424242),
    900: Color(0xFF212121)
};

final ThemeData theme = ThemeData(
    fontFamily: "OpenSans",
    primarySwatch: MaterialColor(0xFF212121, colorCodes),
    accentColor: Color(0xFFB71C1C),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)))),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: Colors.black38,
        unselectedLabelStyle: TextStyle(color: Colors.black38),
        selectedItemColor: Colors.black38,
        selectedLabelStyle: TextStyle(color: Colors.black38),
        ),
);
