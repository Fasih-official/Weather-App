import 'package:json_annotation/json_annotation.dart';

part 'sources.g.dart';

@JsonSerializable(nullable: false)
class Sources {
  String title;
  String slug;
  String url;
  int crawl_rate;

  Sources(this.title, this.slug, this.url, this.crawl_rate);

  factory Sources.fromJson(Map<String, dynamic> json) =>
      _$SourcesFromJson(json);

  Map<String, dynamic> toJson() => _$SourcesToJson(this);
}
