import 'package:json_annotation/json_annotation.dart';

part 'taxon.g.dart';

@JsonSerializable()
class Taxon {
  int id;
  String name;
  @JsonKey(name: "pretty_name")
  String prettyName;
  String permalink;
  @JsonKey(name: "parent_id")
  int parentId;
  @JsonKey(name: "taxonomy_id")
  int taxonomyId;
  @JsonKey(name: "meta_title")
  String metaTitle;
  @JsonKey(name: "meta_description")
  String metaDescription;
  List<Taxon> taxons;

  Taxon(
      {this.name,
      this.id,
      this.metaDescription,
      this.metaTitle,
      this.parentId,
      this.permalink,
      this.prettyName,
      this.taxonomyId,
      this.taxons});

  factory Taxon.fromJson(Map<String, dynamic> json) =>
      _$TaxonFromJson(json);

  Map<String, dynamic> toJson() => _$TaxonToJson(this);
}
