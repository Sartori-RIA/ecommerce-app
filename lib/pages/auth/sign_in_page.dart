import 'package:ecommerce/data/stores/auth_store.dart';
import 'package:ecommerce/pages/auth/widgets/auth_container.dart';
import 'package:ecommerce/ui/buttons/primary_button.dart';
import 'package:ecommerce/ui/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
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
                controller: _usernameController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: "email"),
                validator: Validators.emailValidator(context),
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
                validator: Validators.passwordValidator(context),
                onChanged: store.setPassword,
              ),
            ),
            PrimaryButton(
                text: "Entrar",
                loading: store.loading,
                onPress: () {
                  if (_formKey.currentState.validate()) {
                    store.signIn(context);
                  }
                }),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/sign_up");
                  },
                  child: Text("Ainda não tem conta?")),
            )
          ],
        ),
      ),
    ));
  }
}
