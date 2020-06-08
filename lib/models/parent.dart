import 'package:json_annotation/json_annotation.dart';

part 'parent.g.dart';

@JsonSerializable(nullable: false)
class Parent {
  String title;
  String location_type;
  int woeid;
  String latt_long;

  Parent(this.title, this.location_type, this.woeid, this.latt_long);

  factory Parent.fromJson(Map<String, dynamic> json) => _$ParentFromJson(json);

  Map<String, dynamic> toJson() => _$ParentToJson(this);
}
