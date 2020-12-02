import 'package:ecommerce/data/stores/auth_store.dart';
import 'package:ecommerce/pages/auth/widgets/auth_container.dart';
import 'package:ecommerce/ui/buttons/primary_button.dart';
import 'package:ecommerce/ui/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
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
                    decoration: InputDecoration(labelText: "email"),
                    validator: Validators.emailValidator(context),
                    onChanged: store.setEmail,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: "Senha"),
                    obscureText: true,
                    validator: Validators.passwordValidator(context),
                    onChanged: store.setPassword,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    controller: _passwordConfirmationController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(labelText: "Confirmar Senha"),
                    obscureText: true,
                    validator: (val) => Validators.confirmPasswordValidator(
                        context, store.passwordConfirmation, store.password),
                    onChanged: store.setPasswordConfirmation,
                  ),
                ),
                PrimaryButton(
                    text: "CRIAR CONTA",
                    loading: store.loading,
                    onPress: () {
                      if (_formKey.currentState.validate()) {
                        store.signUp(context);
                      }
                    })
              ],
            ),
          ),
        ));
  }
}

