// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => $checkedCreate(
      'AppSettings',
      json,
      ($checkedConvert) {
        final val = AppSettings(
          hasSeenOnboarding: $checkedConvert(
              'has_seen_onboarding', (v) => v as bool? ?? false),
          selectedGenres: $checkedConvert(
              'selected_genres',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          typeString: $checkedConvert(
              'type_string', (v) => v as String? ?? 'app_settings'),
        );
        return val;
      },
      fieldKeyMap: const {
        'hasSeenOnboarding': 'has_seen_onboarding',
        'selectedGenres': 'selected_genres',
        'typeString': 'type_string'
      },
    );

Map<String, dynamic> _$AppSettingsToJson(AppSettings instance) =>
    <String, dynamic>{
      'type_string': instance.typeString,
      'has_seen_onboarding': instance.hasSeenOnboarding,
      'selected_genres': instance.selectedGenres,
    };
