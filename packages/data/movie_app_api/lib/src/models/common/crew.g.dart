// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'crew.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Crew _$CrewFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Crew',
      json,
      ($checkedConvert) {
        final val = Crew(
          adult: $checkedConvert('adult', (v) => v as bool? ?? false),
          gender: $checkedConvert('gender', (v) => (v as num?)?.toInt() ?? 0),
          id: $checkedConvert('id', (v) => (v as num?)?.toInt() ?? 0),
          department: $checkedConvert('department', (v) => v as String? ?? ''),
          creditId: $checkedConvert('credit_id', (v) => v as String? ?? ''),
          knownForDepartment: $checkedConvert(
              'known_for_department', (v) => v as String? ?? ''),
          name: $checkedConvert('name', (v) => v as String? ?? ''),
          job: $checkedConvert('job', (v) => v as String? ?? ''),
          originalName:
              $checkedConvert('original_name', (v) => v as String? ?? ''),
          popularity: $checkedConvert(
              'popularity', (v) => (v as num?)?.toDouble() ?? 0.0),
          profilePath:
              $checkedConvert('profile_path', (v) => v as String? ?? ''),
          typeString:
              $checkedConvert('type_string', (v) => v as String? ?? 'crew'),
        );
        return val;
      },
      fieldKeyMap: const {
        'creditId': 'credit_id',
        'knownForDepartment': 'known_for_department',
        'originalName': 'original_name',
        'profilePath': 'profile_path',
        'typeString': 'type_string'
      },
    );

Map<String, dynamic> _$CrewToJson(Crew instance) => <String, dynamic>{
      'type_string': instance.typeString,
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'department': instance.department,
      'credit_id': instance.creditId,
      'job': instance.job,
    };
