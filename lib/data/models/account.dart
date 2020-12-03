import 'package:dio/dio.dart';
import 'package:ecommerce/utils/dio_config.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  String email;
  @JsonKey(name: "store_credits")
  double storeCredits;
  @JsonKey(name: "completed_orders")
  int completedOrders;

  Account({this.email, this.completedOrders, this.storeCredits});

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}

@RestApi()
abstract class AccountApi {
  factory AccountApi(Dio dio, {String baseUrl}) = _AccountApi;

  @GET("/api/v2/storefront/account")
  @Header(JSON_HEADER)
  Future<HttpResponse> load();

  @PATCH("/api/v2/storefront/account")
  @Header(JSON_HEADER)
  Future<HttpResponse> update(@Body() Map<String, dynamic> data);
}