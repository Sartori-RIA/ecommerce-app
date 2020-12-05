import 'package:ecommerce/data/models/order.dart';
import 'package:ecommerce/data/models/product.dart';
import 'package:ecommerce/data/models/wish_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'spree_response.g.dart';

@JsonSerializable()
class SpreeResponse {
  int count;
  @JsonKey(name: "total_count")
  int totalCount;
  @JsonKey(name: "current_page")
  int currentPage;
  @JsonKey(name: "per_page")
  int perPage;
  int pages;

  SpreeResponse(
      {this.currentPage,
      this.count,
      this.pages,
      this.perPage,
      this.totalCount});

  factory SpreeResponse.fromJson(Map<String, dynamic> json) =>
      _$SpreeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SpreeResponseToJson(this);
}

@JsonSerializable()
class ProductPaginated extends SpreeResponse {
  List<Product> products;

  ProductPaginated({this.products});

  factory ProductPaginated.fromJson(Map<String, dynamic> json) =>
      _$ProductPaginatedFromJson(json);

  Map<String, dynamic> toJson() => _$ProductPaginatedToJson(this);
}

@JsonSerializable()
class OrderPaginated extends SpreeResponse {
  List<Order> orders;

  OrderPaginated({this.orders});

  factory OrderPaginated.fromJson(Map<String, dynamic> json) =>
      _$OrderPaginatedFromJson(json);

  Map<String, dynamic> toJson() => _$OrderPaginatedToJson(this);
}

@JsonSerializable()
class WishListsPaginated extends SpreeResponse {
  List<WishList> wishlists;

  WishListsPaginated({this.wishlists});

  factory WishListsPaginated.fromJson(Map<String, dynamic> json) =>
      _$WishListsPaginatedFromJson(json);

  Map<String, dynamic> toJson() => _$WishListsPaginatedToJson(this);
}