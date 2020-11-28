import 'package:json_annotation/json_annotation.dart';

part 'option_type.g.dart';

@JsonSerializable()
class OptionType {
  int id;
  String name;
  String presentation;
  int position;

  OptionType({this.id, this.name, this.position, this.presentation});

  factory OptionType.fromJson(Map<String, dynamic> json) =>
      _$OptionTypeFromJson(json);

  Map<String, dynamic> toJson() => _$OptionTypeToJson(this);
}
