// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'genre.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Genre _$GenreFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Genre',
      json,
      ($checkedConvert) {
        final val = Genre(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt() ?? 0),
          name: $checkedConvert('name', (v) => v as String? ?? ''),
        );
        return val;
      },
    );

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
