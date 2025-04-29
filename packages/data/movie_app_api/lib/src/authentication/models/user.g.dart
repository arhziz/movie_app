// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => $checkedCreate(
      'User',
      json,
      ($checkedConvert) {
        final val = User(
          email: $checkedConvert('email', (v) => v as String? ?? ''),
          country: $checkedConvert('country', (v) => v as String? ?? ''),
          fullName: $checkedConvert('full_name', (v) => v as String? ?? ''),
          phoneNumber:
              $checkedConvert('phone_number', (v) => v as String? ?? ''),
        );
        return val;
      },
      fieldKeyMap: const {
        'fullName': 'full_name',
        'phoneNumber': 'phone_number'
      },
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'full_name': instance.fullName,
      'phone_number': instance.phoneNumber,
      'country': instance.country,
    };
