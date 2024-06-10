// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactUser _$ContactUserFromJson(Map<String, dynamic> json) => ContactUser(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$ContactUserToJson(ContactUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };
