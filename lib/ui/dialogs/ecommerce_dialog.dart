import 'package:ecommerce/ui/buttons/primary_button.dart';
import 'package:ecommerce/ui/buttons/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class EcommerceDialog extends StatelessWidget {
  final String title;
  final Widget child;
  final bool showOkButton;
  final bool showCancelButton;
  final VoidCallback okPress;
  final VoidCallback cancelPress;
  final String okButtonText;

  EcommerceDialog(
      {@required this.title,
      @required this.child,
      @required this.showOkButton,
      @required this.showCancelButton,
      this.okButtonText = "buttons.ok",
      this.okPress,
      this.cancelPress});

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text(
          FlutterI18n.translate(context, title),
          textAlign: TextAlign.center,
        ),
        content: child,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        actions: <Widget>[
          showCancelButton
              ? RoundedButton(
                  text: "buttons.cancel",
                  onPressed: () => cancelPress(),
                  textColor: Colors.black,
                  bgColor: Colors.white60,
                  loading: false,
                  height: 30,
                  minWidth: 50,
                )
              : Container(),
          showOkButton
              ? PrimaryButton(
                  height: 30,
                  minWidth: 50,
                  text: okButtonText,
                  loading: false,
                  onPress: () => okPress(),
                )
              : Container()
        ],
      );
}
