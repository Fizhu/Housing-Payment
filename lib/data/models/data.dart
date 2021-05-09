import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class ResponseData<T> {
  @JsonKey(name: 'status')
  final bool status;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'data')
  final Map<String, dynamic> data;

  ResponseData({this.status, this.message, this.data});

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}

@JsonSerializable()
class ResponseList {
  @JsonKey(name: 'status')
  final bool status;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'total')
  final int total;
  @JsonKey(name: 'data')
  final List<dynamic> list;


  ResponseList(this.status, this.message, this.total, this.list);

  factory ResponseList.fromJson(Map<String, dynamic> json) =>
      _$ResponseListFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseListToJson(this);
}

@JsonSerializable()
class User {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'no_kontrak')
  final String no_kontrak;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'role')
  final String role;

  User(this.id, this.name, this.no_kontrak, this.password, this.role);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

