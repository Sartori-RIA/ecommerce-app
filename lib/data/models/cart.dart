import 'package:dio/dio.dart';
import 'package:ecommerce/data/models/spree_model.dart';
import 'package:ecommerce/utils/dio_config.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart {
  String id;
  String type;
  CartAttributes attributes;
  CartRelationships relationships;

  Cart({this.id, this.type, this.relationships, this.attributes});

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}

@JsonSerializable()
class CartAttributes {
  String number;
  @JsonKey(name: "item_total")
  String itemTotal;
  String total;
  @JsonKey(name: "ship_total")
  String shipTotal;
  @JsonKey(name: "adjustmentTotal")
  String adjustmentTotal;
  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: "updated_at")
  String updatedAt;
  @JsonKey(name: "completed_at")
  String completedAt;
  @JsonKey(name: "included_tax_total")
  String includedTaxTotal;
  @JsonKey(name: "additional_tax_total")
  String additionalTaxTotal;
  @JsonKey(name: "display_additional_tax_total")
  String displayAdditionalTaxTotal;
  @JsonKey(name: "display_included_tax_total")
  String displayIncludedTaxTotal;
  @JsonKey(name: "tax_total")
  String taxTotal;
  String currency;
  String state;
  String token;
  String email;
  @JsonKey(name: "display_item_total")
  String displayItemTotal;
  @JsonKey(name: "display_ship_total")
  String displayShipTotal;
  @JsonKey(name: "display_adjustment_total")
  String displayAdjustmentTotal;
  @JsonKey(name: "display_tax_total")
  String displayTaxTotal;
  @JsonKey(name: "promo_total")
  String promoTotal;
  @JsonKey(name: "display_promo_total")
  String displayPromoTotal;
  @JsonKey(name: "item_count")
  int itemCount;
  @JsonKey(name: "special_instructions")
  String specialInstructions;
  @JsonKey(name: "display_total")
  String displayTotal;
  @JsonKey(name: "pre_tax_item_amount")
  String preTaxItemAmount;
  @JsonKey(name: "display_pre_tax_item_amount")
  String displayPreTaxItemAmount;
  @JsonKey(name: "pre_tax_total")
  String preTaxTotal;
  @JsonKey(name: "display_pre_tax_total")
  String displayPreTaxTotal;

  CartAttributes(
      {this.email,
      this.token,
      this.number,
      this.updatedAt,
      this.createdAt,
      this.additionalTaxTotal,
      this.adjustmentTotal,
      this.completedAt,
      this.currency,
      this.displayAdditionalTaxTotal,
      this.displayAdjustmentTotal,
      this.displayIncludedTaxTotal,
      this.displayItemTotal,
      this.displayPreTaxItemAmount,
      this.displayPreTaxTotal,
      this.displayPromoTotal,
      this.displayShipTotal,
      this.displayTaxTotal,
      this.displayTotal,
      this.includedTaxTotal,
      this.itemCount,
      this.itemTotal,
      this.preTaxItemAmount,
      this.preTaxTotal,
      this.promoTotal,
      this.shipTotal,
      this.specialInstructions,
      this.state,
      this.taxTotal,
      this.total});

  factory CartAttributes.fromJson(Map<String, dynamic> json) =>
      _$CartAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$CartAttributesToJson(this);
}

@JsonSerializable()
class CartRelationships {
  @JsonKey(name: "line_items")
  SpreeRelationshipsItem lineItems;
  SpreeRelationshipsItem variants;
  //SpreeRelationshipsItem promotions;
  //SpreeRelationshipsItem payments;
  //SpreeRelationshipsItem shipments;
  //SpreeRelationshipsItem user;
  //@JsonKey(name: "billing_address")
  //SpreeRelationshipsItem billingAddress;
  //@JsonKey(name: "shipping_address")
 // SpreeRelationshipsItem shippingAddress;

  CartRelationships(
      {
      this.lineItems,
      this.variants});

  factory CartRelationships.fromJson(Map<String, dynamic> json) =>
      _$CartRelationshipsFromJson(json);

  Map<String, dynamic> toJson() => _$CartRelationshipsToJson(this);
}

@RestApi()
abstract class CartApi {
  factory CartApi(Dio dio, {String baseUrl}) = _CartApi;

  @POST("/api/v2/storefront/cart")
  @Header(JSON_HEADER)
  Future<HttpResponse> create();

  @GET("/api/v2/storefront/cart")
  @Header(JSON_HEADER)
  Future<HttpResponse> fetchCart();

  @POST("/api/v2/storefront/cart/add_item")
  @Header(JSON_HEADER)
  Future<HttpResponse> addItem(@Body() Map<String, dynamic> data);

  @DELETE("/api/v2/storefront/cart/remove_line_item/{line_id}")
  @Header(JSON_HEADER)
  Future<HttpResponse> removeItem(@Path("line_id") String lineId);

  @PATCH("/api/v2/storefront/cart/empty")
  @Header(JSON_HEADER)
  Future<HttpResponse> empty();

  @PATCH("/api/v2/storefront/cart/set_quantity")
  @Header(JSON_HEADER)
  Future<HttpResponse> setQuantity(@Body() Map<String, dynamic> data);
}
