import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color bgColor;
  final double minWidth;
  final double height;
  final bool loading;
  final Color loadingColor;

  RoundedButton(
      {@required this.onPressed,
      @required this.text,
      @required this.bgColor,
      @required this.textColor,
      this.loading = false,
      this.loadingColor,
      this.height,
      this.minWidth});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ButtonTheme(
            minWidth: minWidth == null ? 300.0 : minWidth,
            height: height == null ? 60.0 : height,
            child: RaisedButton(
              onPressed: () {
                onPressed();
              },
              color: bgColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: loading
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          loadingColor == null
                              ? Theme.of(context).primaryColor
                              : loadingColor),
                      strokeWidth: 2.0,
                    )
                  : Text(
                      FlutterI18n.translate(context, text),
                      style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.3),
                    ),
            )),
      );
}
