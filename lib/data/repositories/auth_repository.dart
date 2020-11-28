import 'package:ecommerce/data/models/auth.dart';
import 'package:ecommerce/utils/dio_config.dart';
import 'package:retrofit/retrofit.dart';

class AuthRepository {
  static final AuthRepository _instance = AuthRepository.internal();

  factory AuthRepository() => _instance;

  final _api = AuthApi(DioConfig().dio);

  AuthRepository.internal();

  Future<HttpResponse> signUp(SignUpPayload data) async =>
      await _api.signUp({"user": data});

  Future<HttpResponse> signIn(SignInPayload data) async =>
      await _api.signIn(data);
}
