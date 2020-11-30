import 'package:dio/dio.dart';
import 'package:ecommerce/data/models/product.dart';
import 'package:ecommerce/utils/dio_config.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import 'spree_response.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  int id;
  String number;
  @JsonKey(name: "item_total")
  String itemTotal;
  String total;
  @JsonKey(name: "ship_total")
  String shipTotal;
  String state;
  @JsonKey(name: "adjustment_total")
  String adjustmentTotal;
  @JsonKey(name: "user_id")
  int userId;
  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: "updated_at")
  String updatedAt;
  @JsonKey(name: "completed_at")
  String completedAt;
  @JsonKey(name: "payment_total")
  String paymentTotal;
  @JsonKey(name: "shipment_state")
  String shipmentState;
  @JsonKey(name: "payment_state")
  String paymentState;
  String email;
  @JsonKey(name: "special_instructions")
  String specialInstructions;
  String channel;
  @JsonKey(name: "included_tax_total")
  String includedTaxTotal;
  @JsonKey(name: "additional_tax_total")
  String additionalTaxTotal;
  @JsonKey(name: "display_included_tax_total")
  String displayIncludedTaxTotal;
  @JsonKey(name: "display_additional_tax_total")
  String displayAdditionalTaxTotal;
  @JsonKey(name: "tax_total")
  String taxTotal;
  String currency;
  @JsonKey(name: "considered_risky")
  bool consideredRisky;
  @JsonKey(name: "canceler_id")
  int cancelerId;
  @JsonKey(name: "display_item_total")
  String displayItemTotal;
  @JsonKey(name: "total_quantity")
  int totalQuantity;
  @JsonKey(name: "display_total")
  String displayTotal;
  @JsonKey(name: "display_ship_total")
  String displayShipTotal;
  @JsonKey(name: "display_tax_total")
  String displayTaxTotal;
  @JsonKey(name: "display_adjustment_total")
  String displayAdjustmentTotal;
  String token;
  @JsonKey(name: "checkout_steps")
  List<String> checkoutSteps;
  @JsonKey(name: "line_items")
  List<OrderLineItem> lineItems;

  Order(
      {this.id,
      this.total,
      this.lineItems,
      this.currency,
      this.email,
      this.taxTotal,
      this.state,
      this.specialInstructions,
      this.shipTotal,
      this.itemTotal,
      this.includedTaxTotal,
      this.displayTotal,
      this.displayShipTotal,
      this.displayItemTotal,
      this.displayIncludedTaxTotal,
      this.displayAdjustmentTotal,
      this.displayAdditionalTaxTotal,
      this.completedAt,
      this.adjustmentTotal,
      this.additionalTaxTotal,
      this.createdAt,
      this.updatedAt,
      this.number,
      this.token,
      this.cancelerId,
      this.channel,
      this.checkoutSteps,
      this.consideredRisky,
      this.displayTaxTotal,
      this.paymentState,
      this.paymentTotal,
      this.shipmentState,
      this.totalQuantity,
      this.userId,
      });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable()
class OrderLineItem {
  int id;
  int quantity;
  String price;
  @JsonKey(name: "variant_id")
  int variantId;
  Product variant;
  @JsonKey(name: "single_display_amount")
  String singleDisplayAmount;
  @JsonKey(name: "display_amount")
  String displayAmount;
  String total;

  OrderLineItem(
      {this.total,
      this.id,
      this.quantity,
      this.price,
      this.displayAmount,
      this.singleDisplayAmount,
      this.variant,
      this.variantId});

  factory OrderLineItem.fromJson(Map<String, dynamic> json) =>
      _$OrderLineItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderLineItemToJson(this);
}

@RestApi()
abstract class OrderApi {
  factory OrderApi(Dio dio, {String baseUrl}) = _OrderApi;

  @GET("/api/v1/orders/{order_number}")
  @Header(JSON_HEADER)
  Future<Order> findOrder(@Path("order_number") String orderNumber);

  @GET("/api/v1/orders")
  @Header(JSON_HEADER)
  Future<OrderPaginated> all();
}
