import 'package:ecommerce/pages/auth/widgets/auth_container.dart';
import 'package:ecommerce/ui/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AuthContainer(children: [
      TextFormField(
        controller: usernameController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(labelText: "email"),
      ),
      Padding(
        padding: EdgeInsets.only(top: 10),
        child: TextFormField(
          controller: passwordController,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          obscureText: true,
          decoration: InputDecoration(labelText: "password"),
        ),
      ),
      PrimaryButton(text: "Entrar", onPress: () {}),
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, "/sign_up");
            },
            child: Text("Ainda não tem conta?")),
      )
    ]);
  }
}
