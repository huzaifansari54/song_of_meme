// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthEntityImpl _$$AuthEntityImplFromJson(Map<String, dynamic> json) =>
    _$AuthEntityImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      profileUrl: json['profileUrl'] as String,
    );

Map<String, dynamic> _$$AuthEntityImplToJson(_$AuthEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'profileUrl': instance.profileUrl,
    };
