import 'package:ecommerce/data/stores/account_store.dart';
import 'package:ecommerce/ui/buttons/primary_button.dart';
import 'package:ecommerce/ui/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AccountStore _store;

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    _store = Provider.of<AccountStore>(context);
    await _store.load(context);
    _emailController.text = _store.email;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => LoadingOverlay(
        isLoading: _store.loading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(labelText: "email"),
                    validator: Validators.emailValidator(context),
                    onChanged: _store.setEmail,
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
                    onChanged: _store.setPassword,
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
                        context, _store.passwordConfirmation, _store.password),
                    onChanged: _store.setPasswordConfirmation,
                  ),
                ),
                PrimaryButton(
                  loading: _store.loading,
                  text: "ATUALIZAR",
                  onPress: () {
                    if(_formKey.currentState.validate()) {
                      _store.update(context);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
