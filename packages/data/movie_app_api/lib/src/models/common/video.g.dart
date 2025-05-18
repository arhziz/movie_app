// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Video _$VideoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Video',
      json,
      ($checkedConvert) {
        final val = Video(
          id: $checkedConvert('id', (v) => v as String? ?? ''),
          iso31661: $checkedConvert('iso_3166_1', (v) => v as String? ?? ''),
          iso6391: $checkedConvert('iso_639_1', (v) => v as String? ?? ''),
          key: $checkedConvert('key', (v) => v as String? ?? ''),
          name: $checkedConvert('name', (v) => v as String? ?? ''),
          official: $checkedConvert('official', (v) => v as bool? ?? false),
          publishedAt:
              $checkedConvert('published_at', (v) => v as String? ?? ''),
          site: $checkedConvert('site', (v) => v as String? ?? ''),
          size: $checkedConvert('size', (v) => (v as num?)?.toInt() ?? 0),
          type: $checkedConvert('type', (v) => v as String? ?? ''),
          typeString:
              $checkedConvert('type_string', (v) => v as String? ?? 'video'),
        );
        return val;
      },
      fieldKeyMap: const {
        'iso31661': 'iso_3166_1',
        'iso6391': 'iso_639_1',
        'publishedAt': 'published_at',
        'typeString': 'type_string'
      },
    );

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'type_string': instance.typeString,
      'iso_639_1': instance.iso6391,
      'iso_3166_1': instance.iso31661,
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'size': instance.size,
      'type': instance.type,
      'official': instance.official,
      'published_at': instance.publishedAt,
      'id': instance.id,
    };
