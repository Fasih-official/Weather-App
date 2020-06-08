// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sources.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sources _$SourcesFromJson(Map<String, dynamic> json) {
  return Sources(
    json['title'] as String,
    json['slug'] as String,
    json['url'] as String,
    json['crawl_rate'] as int,
  );
}

Map<String, dynamic> _$SourcesToJson(Sources instance) => <String, dynamic>{
      'title': instance.title,
      'slug': instance.slug,
      'url': instance.url,
      'crawl_rate': instance.crawl_rate,
    };
