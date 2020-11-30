import 'package:ecommerce/data/models/cart.dart';
import 'package:json_annotation/json_annotation.dart';

part 'spree_model.g.dart';

@JsonSerializable()
class SpreeData {
  Map<String, dynamic> data;
  SpreeData({this.data});

  factory SpreeData.fromJson(Map<String, dynamic> json) =>
      _$SpreeDataFromJson(json);

  Map<String, dynamic> toJson() => _$SpreeDataToJson(this);
}

@JsonSerializable()
class SpreeRelationshipsItem {
  List<SpreeRelationshipsData> data;

  SpreeRelationshipsItem({this.data});

  factory SpreeRelationshipsItem.fromJson(Map<String, dynamic> json) =>
      _$SpreeRelationshipsItemFromJson(json);

  Map<String, dynamic> toJson() => _$SpreeRelationshipsItemToJson(this);
}

@JsonSerializable()
class SpreeRelationshipsData {
  String id;
  String type;

  SpreeRelationshipsData({this.id, this.type});

  factory SpreeRelationshipsData.fromJson(Map<String, dynamic> json) =>
      _$SpreeRelationshipsDataFromJson(json);

  Map<String, dynamic> toJson() => _$SpreeRelationshipsDataToJson(this);
}
