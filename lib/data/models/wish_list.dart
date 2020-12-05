import 'package:dio/dio.dart';
import 'package:ecommerce/utils/dio_config.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import 'spree_response.dart';

part 'wish_list.g.dart';

@JsonSerializable()
class WishList {
  int id;
  String name;
  @JsonKey(name: "access_hash")
  String accessHash;
  @JsonKey(name: "is_private")
  bool isPrivate;
  @JsonKey(name: "is_default")
  bool isDefault;

  WishList(
      {this.name, this.accessHash, this.isDefault, this.isPrivate, this.id});

  factory WishList.fromJson(Map<String, dynamic> json) =>
      _$WishListFromJson(json);

  Map<String, dynamic> toJson() => _$WishListToJson(this);
}

@RestApi()
abstract class WishListApi {
  factory WishListApi(Dio dio, {String baseUrl}) = _WishListApi;

  @GET("/api/v1/wishlists")
  @Header(JSON_HEADER)
  Future<WishListsPaginated> fetch(@Query("page") String page);

  @POST("/api/v1/wishlists")
  @Header(JSON_HEADER)
  Future<WishList> create(@Body() Map<String, dynamic> data);

  @POST("/api/v1/wished_products")
  @Header(JSON_HEADER)
  Future<WishList> addProduct(@Body() Map<String, dynamic> data);

  @DELETE("/api/v1/wished_products/{id}")
  @Header(JSON_HEADER)
  Future<WishList> deleteProduct(@Path("id") String id);

  @DELETE("/api/v1/wished_products/{id}")
  @Header(JSON_HEADER)
  Future<WishList> delete(@Path("id") String id);
}
