import 'package:json_annotation/json_annotation.dart';

part 'product_property.g.dart';

@JsonSerializable()
class ProductProperty {
  int id;
  @JsonKey(name: "product_id")
  int productId;
  @JsonKey(name: "property_id")
  int propertyId;
  String value;
  @JsonKey(name: "property_name")
  String propertyName;

  ProductProperty(
      {this.id,
      this.value,
      this.productId,
      this.propertyId,
      this.propertyName});

  factory ProductProperty.fromJson(Map<String, dynamic> json) =>
      _$ProductPropertyFromJson(json);

  Map<String, dynamic> toJson() => _$ProductPropertyToJson(this);
}
