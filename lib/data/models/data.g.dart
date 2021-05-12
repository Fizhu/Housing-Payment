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
    json['username'] as String,
    json['password'] as String,
    json['role'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'password': instance.password,
      'role': instance.role,
    };

Tagihan _$TagihanFromJson(Map<String, dynamic> json) {
  return Tagihan(
    json['id'] as int,
    json['user_id'] as int,
    json['stan_meter_awal'] as int,
    json['stan_meter_akhir'] as int,
    json['penggunaan'] as int,
    json['tagihan_air'] as int,
    json['sampah'] as int,
    json['keamanan'] as int,
    json['admin'] as int,
    json['sub_total_tagihan'] as int,
    json['denda'] as int,
    json['grand_total'] as int,
    json['date'] as String,
    json['status'] as int,
    json['name'] as String,
    json['username'] as String,
  );
}

Map<String, dynamic> _$TagihanToJson(Tagihan instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'stan_meter_awal': instance.stan_meter_awal,
      'stan_meter_akhir': instance.stan_meter_akhir,
      'penggunaan': instance.penggunaan,
      'tagihan_air': instance.tagihan_air,
      'sampah': instance.sampah,
      'keamanan': instance.keamanan,
      'admin': instance.admin,
      'sub_total_tagihan': instance.sub_total_tagihan,
      'denda': instance.denda,
      'grand_total': instance.grand_total,
      'date': instance.date,
      'status': instance.status,
      'name': instance.name,
      'username': instance.username,
    };
