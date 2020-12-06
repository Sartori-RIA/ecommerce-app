import 'dart:async';

import 'package:ecommerce/data/models/auth.dart';
import 'package:ecommerce/data/repositories/auth_repository.dart';
import 'package:ecommerce/ui/dialogs/ecommerce_dialog.dart';
import 'package:ecommerce/utils/authentication.dart';
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
  bool success = false;

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
  Future<void> signIn(BuildContext context) async {
    try {
      loading = true;
      final response =
          await _repository.signIn(username: username, password: password);
      success = true;
      Timer(Duration(seconds: 1), () {
        Authentication.saveToken(
            response.data["access_token"], response.data["refresh_token"]);
        Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
      });
    } catch (e, s) {
      success = false;
      print(e);
      print(s);
      _errorDialog(context, "messages.sign.in.error.title",
          "messages.sign.in.error.subtitle");
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> signUp(BuildContext context) async {
    try {
      loading = true;
      await _repository.signUp(SignUpPayload(
          email: email,
          password: password,
          passwordConfirmation: passwordConfirmation));
      Navigator.pushNamedAndRemoveUntil(context, "/sign_in", (route) => false);
    } catch (e, s) {
      print(e);
      print(s);
      _errorDialog(context, "messages.sign.up.error.title",
          "messages.sign.up.error.subtitle");
    } finally {
      loading = false;
    }
  }

  void _errorDialog(BuildContext context, String title, String subtitle) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (ctx) => EcommerceDialog(
              title: FlutterI18n.translate(context, title),
              child: Container(
                child: Text(
                  FlutterI18n.translate(context, subtitle),
                  textAlign: TextAlign.center,
                ),
              ),
              okPress: () => Navigator.pop(ctx),
              showOkButton: true,
              showCancelButton: false,
            ));
  }
}
