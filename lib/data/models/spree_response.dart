import 'package:ecommerce/data/models/product.dart';
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

  SpreeResponse({this.currentPage, this.count, this.pages, this.perPage, this.totalCount});

  factory SpreeResponse.fromJson(Map<String, dynamic> json) =>
      _$SpreeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SpreeResponseToJson(this);
}

@JsonSerializable()
class ProductPaginated extends SpreeResponse{
  List<Product> products;

  ProductPaginated({this.products});

  factory ProductPaginated.fromJson(Map<String, dynamic> json) =>
      _$ProductPaginatedFromJson(json);

  Map<String, dynamic> toJson() => _$ProductPaginatedToJson(this);
}