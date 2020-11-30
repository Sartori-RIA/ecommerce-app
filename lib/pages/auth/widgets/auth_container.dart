import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class AuthContainer extends StatelessWidget {

  final List<Widget> children;

  AuthContainer({@required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/necromicon.png",
                      height: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        FlutterI18n.translate(context, "pages.home.title"),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    Text("Aqui a sua alma vale muito mais"),
                    ...children
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
