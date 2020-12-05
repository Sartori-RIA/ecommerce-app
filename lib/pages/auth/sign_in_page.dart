import 'dart:async';

import 'package:ecommerce/data/stores/auth_store.dart';
import 'package:ecommerce/pages/auth/widgets/auth_container.dart';
import 'package:ecommerce/ui/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _btnController = new RoundedLoadingButtonController();
  final _formKey = GlobalKey<FormState>();
  AuthStore store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = Provider.of<AuthStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return AuthContainer(
      child: Observer(
        builder: (_) {
          try {
            if (store.success) {
              _btnController.success();
            } else {
              _btnController.reset();
            }
          } catch (_) {}
          return Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextFormField(
                      controller: _usernameController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(labelText: "email"),
                      validator: Validators.email(context),
                      onChanged: store.setUsername,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      decoration: InputDecoration(labelText: "password"),
                      validator: Validators.password(context),
                      onChanged: store.setPassword,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: RoundedLoadingButton(
                      child: Text(
                        "ENTRAR",
                        style: TextStyle(color: Colors.white),
                      ),
                      controller: _btnController,
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          store.signIn(context);
                        } else {
                          _btnController.error();
                          Timer(Duration(seconds: 1), () => _btnController.reset());
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/sign_up");
                        },
                        child: Text("Ainda não tem conta?")),
                  )
                ],
              ));
        },
      ),
    );
  }
}
