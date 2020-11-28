import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(FlutterI18n.translate(context, "pages.home.title")),
        ),
        body: Container(
          child: Text("eae"),
        ),
      );
}
