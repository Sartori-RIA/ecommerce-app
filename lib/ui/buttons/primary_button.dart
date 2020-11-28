import 'package:flutter/material.dart';

import 'rounded_button.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final double minWidth;
  final double height;
  final bool loading;

  PrimaryButton(
      {@required this.text,
      @required this.onPress,
      this.height,
      this.loading,
      this.minWidth});

  @override
  Widget build(BuildContext context) => RoundedButton(
        textColor: Colors.white,
        bgColor: Theme.of(context).primaryColor,
        text: text,
        loading: loading,
        loadingColor: Colors.white,
        onPressed: onPress,
        height: height,
        minWidth: minWidth,
      );
}
