import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Validators {
  static final required = (BuildContext context) => MultiValidator([
        RequiredValidator(
            errorText:
                FlutterI18n.translate(context, "validators.name.required"))
      ]);

  static final password = (BuildContext context) => MultiValidator([
        RequiredValidator(
            errorText:
                FlutterI18n.translate(context, "validators.password.required")),
        MinLengthValidator(8,
            errorText: FlutterI18n.translate(
                context, "validators.password.min_length")),
        MaxLengthValidator(128,
            errorText: FlutterI18n.translate(
                context, "validators.password.max_length"))
      ]);

  static final email = (BuildContext context) => MultiValidator([
        EmailValidator(
            errorText:
                FlutterI18n.translate(context, "validators.email.invalid")),
        RequiredValidator(
            errorText:
                FlutterI18n.translate(context, "validators.email.required")),
      ]);

  static final confirmPassword =
      (BuildContext context, String value, String password) => MatchValidator(
              errorText: FlutterI18n.translate(
                  context, "validators.confirm_password.equals"))
          .validateMatch(value, password);
}
