import 'package:ecommerce/pages/auth/widgets/auth_container.dart';
import 'package:ecommerce/ui/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthContainer(children: [
      PrimaryButton(text: "CRIAR CONTA", onPress: () {
        Navigator.pushNamedAndRemoveUntil(context, "/sign_in", (route) => false);
      }),

    ]);
  }
}
