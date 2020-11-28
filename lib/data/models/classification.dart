import 'package:json_annotation/json_annotation.dart';

import 'taxon.dart';

part 'classification.g.dart';

@JsonSerializable()
class Classification {
  @JsonKey(name: "taxon_id")
  int taxonId;
  int position;
  Taxon taxon;

  Classification({this.taxon, this.position, this.taxonId});

  factory Classification.fromJson(Map<String, dynamic> json) =>
      _$ClassificationFromJson(json);

  Map<String, dynamic> toJson() => _$ClassificationToJson(this);
}
