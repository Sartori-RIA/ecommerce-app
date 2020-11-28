import 'package:dio/dio.dart';
import 'package:ecommerce/data/models/classification.dart';
import 'package:ecommerce/data/models/product_property.dart';
import 'package:ecommerce/data/models/spree_image.dart';
import 'package:ecommerce/utils/dio_config.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';

import 'option_type.dart';
import 'spree_response.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int id;
  String name;
  String description;
  String price;
  @JsonKey(name: "cost_price")
  String costPrice;
  @JsonKey(name: "display_price")
  String displayPrice;
  @JsonKey(name: "available_on")
  String availableOn;
  String slug;
  @JsonKey(name: "meta_description")
  String metaDescription;
  @JsonKey(name: "meta_keywords")
  String metaKeywords;
  @JsonKey(name: "shipping_category_id")
  int shippingCategoryId;
  @JsonKey(name: "taxon_ids")
  List<int> taxonIds;
  @JsonKey(name: "total_on_hand")
  int totalOnHand;
  @JsonKey(name: "option_types")
  List<OptionType> optionTypes;
  @JsonKey(name: "product_properties")
  List<ProductProperty> productProperties;
  List<Classification> classifications;
  @JsonKey(name: "has_variants")
  bool hasVariants;
  @JsonKey(name: "track+inventory")
  bool trackInventory;
  @JsonKey(name: "is_admin")
  bool isMaster;
  @JsonKey(name: "in_stock")
  bool inStock;
  @JsonKey(name: "is_backorderable")
  bool isBackorderable;
  @JsonKey(name: "is_orderable")
  bool isOrderable;
  @JsonKey(name: "is_destroyed")
  bool isDestroyed;
  String weight;
  String height;
  String width;
  String depth;
  @JsonKey(name: "options_text")
  String optionsText;
  List<SpreeImage> images;

  Product(
      {this.metaDescription,
      this.id,
      this.name,
      this.description,
      this.height,
      this.weight,
      this.availableOn,
      this.classifications,
      this.costPrice,
      this.depth,
      this.displayPrice,
      this.hasVariants,
      this.images,
      this.inStock,
      this.isBackorderable,
      this.isDestroyed,
      this.isMaster,
      this.isOrderable,
      this.metaKeywords,
      this.optionsText,
      this.optionTypes,
      this.price,
      this.productProperties,
      this.shippingCategoryId,
      this.slug,
      this.taxonIds,
      this.totalOnHand,
      this.trackInventory,
      this.width});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@RestApi()
abstract class ProductApi {
  factory ProductApi(Dio dio, {String baseUrl}) = _ProductApi;

  @GET("/api/v2/storefront/products")
  @Header(JSON_HEADER)
  Future<ProductPaginated> products();

  @GET("/api/v2/storefront/products/{id}")
  @Header(JSON_HEADER)
  Future<Product> productDetail(@Path("id") String id);
}
