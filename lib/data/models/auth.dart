import 'package:dio/dio.dart';
import 'package:ecommerce/utils/dio_config.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'auth.g.dart';

@JsonSerializable()
class SignInPayload {
  String username;
  String password;
  @JsonKey(name: "grant_type")
  String grantType;

  SignInPayload({this.password, this.grantType, this.username});

  factory SignInPayload.fromJson(Map<String, dynamic> json) =>
      _$SignInPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$SignInPayloadToJson(this);
}

@JsonSerializable()
class SignUpPayload {
  String email;
  String password;
  @JsonKey(name: "password_confirmation")
  String passwordConfirmation;

  SignUpPayload({this.password, this.email, this.passwordConfirmation});

  factory SignUpPayload.fromJson(Map<String, dynamic> json) =>
      _$SignUpPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpPayloadToJson(this);
}

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST("/api/v2/storefront/account")
  @Header(JSON_HEADER)
  Future<HttpResponse> signUp(@Body() Map<String, dynamic> data);

  @POST("/spree_oauth/token")
  @Header(JSON_HEADER)
  Future<HttpResponse> signIn(@Body() SignInPayload data);

  @DELETE("/auth/sign_out")
  @Header(JSON_HEADER)
  Future signOut();
}
