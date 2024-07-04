// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseModelImpl _$$ResponseModelImplFromJson(Map<String, dynamic> json) =>
    _$ResponseModelImpl(
      status: json['status'] as String?,
      message: json['message'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$$ResponseModelImplToJson(_$ResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'body': instance.body,
    };
