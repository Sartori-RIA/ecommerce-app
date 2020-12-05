import 'package:ecommerce/data/models/auth.dart';
import 'package:ecommerce/utils/authentication.dart';
import 'package:ecommerce/utils/dio_config.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';

class AuthRepository {
  static final AuthRepository _instance = AuthRepository.internal();

  factory AuthRepository() => _instance;

  AuthRepository.internal();

  final _api = AuthApi(DioConfig().dio);

  Future<HttpResponse> signUp(SignUpPayload data) async =>
      await _api.signUp({"user": data});

  Future<HttpResponse> signIn(
          {@required String username, @required String password}) async =>
      await _api.token({
        "grant_type": "password",
        "username": username,
        "password": password
      });

  Future<HttpResponse> refresh() async {
    final refreshToken = await Authentication.getRefreshToken();
    return await _api.token({
      "grant_type": "refresh_token",
      "refresh_token": refreshToken,
    });
  }
}
