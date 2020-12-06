import 'dart:async';

import 'package:ecommerce/data/stores/auth_store.dart';
import 'package:ecommerce/pages/auth/widgets/auth_container.dart';
import 'package:ecommerce/ui/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
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
        child: Form(
      key: _formKey,
      child: Observer(
        builder: (_) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    labelText: FlutterI18n.translate(
                        context, "model.user.attributes.email")),
                validator: Validators.email(context),
                onChanged: store.setEmail,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    labelText: FlutterI18n.translate(
                        context, "model.user.attributes.password")),
                obscureText: true,
                validator: Validators.password(context),
                onChanged: store.setPassword,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextFormField(
                controller: _passwordConfirmationController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    labelText: FlutterI18n.translate(
                        context, "model.user.attributes.confirm_password")),
                obscureText: true,
                validator: (val) => Validators.confirmPassword(
                    context, store.passwordConfirmation, store.password),
                onChanged: store.setPasswordConfirmation,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: RoundedLoadingButton(
                child: Text(
                  FlutterI18n.translate(context, "pages.auth.sign_up.button"),
                  style: TextStyle(color: Colors.white),
                ),
                controller: _btnController,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    store.signUp(context);
                  } else {
                    _btnController.error();
                    Timer(Duration(seconds: 1), () => _btnController.reset());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
