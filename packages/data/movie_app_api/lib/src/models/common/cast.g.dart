// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cast _$CastFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Cast',
      json,
      ($checkedConvert) {
        final val = Cast(
          adult: $checkedConvert('adult', (v) => v as bool? ?? false),
          gender: $checkedConvert('gender', (v) => (v as num?)?.toInt() ?? 0),
          id: $checkedConvert('id', (v) => (v as num?)?.toInt() ?? 0),
          castId: $checkedConvert('cast_id', (v) => (v as num?)?.toInt() ?? 0),
          character: $checkedConvert('character', (v) => v as String? ?? ''),
          creditId: $checkedConvert('credit_id', (v) => v as String? ?? ''),
          knownForDepartment: $checkedConvert(
              'known_for_department', (v) => v as String? ?? ''),
          name: $checkedConvert('name', (v) => v as String? ?? ''),
          order: $checkedConvert('order', (v) => (v as num?)?.toInt() ?? 0),
          originalName:
              $checkedConvert('original_name', (v) => v as String? ?? ''),
          popularity: $checkedConvert(
              'popularity', (v) => (v as num?)?.toDouble() ?? 0.0),
          profilePath:
              $checkedConvert('profile_path', (v) => v as String? ?? ''),
          typeString:
              $checkedConvert('type_string', (v) => v as String? ?? 'cast'),
        );
        return val;
      },
      fieldKeyMap: const {
        'castId': 'cast_id',
        'creditId': 'credit_id',
        'knownForDepartment': 'known_for_department',
        'originalName': 'original_name',
        'profilePath': 'profile_path',
        'typeString': 'type_string'
      },
    );

Map<String, dynamic> _$CastToJson(Cast instance) => <String, dynamic>{
      'type_string': instance.typeString,
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'cast_id': instance.castId,
      'character': instance.character,
      'credit_id': instance.creditId,
      'order': instance.order,
    };
