import 'package:ecommerce/data/models/auth.dart';
import 'package:ecommerce/data/repositories/auth_repository.dart';
import 'package:ecommerce/ui/dialogs/ecommerce_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  bool loading = false;

  @observable
  String email = "";

  @observable
  String username = "";

  @observable
  String password = "";

  @observable
  String passwordConfirmation = "";

  final _repository = AuthRepository();

  @action
  void setEmail(String value) => email = value.trim();

  @action
  void setUsername(String value) => username = value.trim();

  @action
  void setPassword(String value) => password = value.trim();

  @action
  void setPasswordConfirmation(String value) =>
      passwordConfirmation = value.trim();

  @action
  Future<void> signUp(BuildContext context) async {
    try {
      await _repository.signUp(SignUpPayload(
          email: email,
          password: password,
          passwordConfirmation: passwordConfirmation));
      Navigator.pushNamedAndRemoveUntil(context, "/sign_in", (route) => false);
    } catch (e, s) {
      print(e);
      print(s);
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (ctx) => EcommerceDialog(
                title: FlutterI18n.translate(
                    context, "messages.create.account.error.title"),
                child: Container(
                  child: Text(
                    FlutterI18n.translate(
                        context, "messages.create.account.error.subtitle"),
                    textAlign: TextAlign.center,
                  ),
                ),
                okPress: () => Navigator.pop(ctx),
                showOkButton: true,
                showCancelButton: false,
              ));
    } finally {
      loading = false;
    }
  }
}
