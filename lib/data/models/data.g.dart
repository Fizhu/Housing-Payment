// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseData<T> _$ResponseDataFromJson<T>(Map<String, dynamic> json) {
  return ResponseData<T>(
    status: json['status'] as bool,
    message: json['message'] as String,
    data: json['data'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$ResponseDataToJson<T>(ResponseData<T> instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

ResponseList _$ResponseListFromJson(Map<String, dynamic> json) {
  return ResponseList(
    json['status'] as bool,
    json['message'] as String,
    json['total'] as int,
    json['data'] as List,
  );
}

Map<String, dynamic> _$ResponseListToJson(ResponseList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'total': instance.total,
      'data': instance.list,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as int,
    json['name'] as String,
    json['no_kontrak'] as String,
    json['password'] as String,
    json['role'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'no_kontrak': instance.no_kontrak,
      'password': instance.password,
      'role': instance.role,
    };
