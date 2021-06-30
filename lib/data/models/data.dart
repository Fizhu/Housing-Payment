import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class ResponseData<T> {
  @JsonKey(name: 'status')
  final bool? status;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'data')
  final Map<String, dynamic>? data;

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
  @JsonKey(name: 'username')
  final String username;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'role')
  final String role;

  User(this.id, this.name, this.username, this.password, this.role);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Tagihan {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'user_id')
  final int user_id;
  @JsonKey(name: 'stan_meter_awal')
  final int stan_meter_awal;
  @JsonKey(name: 'stan_meter_akhir')
  final int stan_meter_akhir;
  @JsonKey(name: 'penggunaan')
  final int penggunaan;
  @JsonKey(name: 'tagihan_air')
  final int tagihan_air;
  @JsonKey(name: 'sampah')
  final int sampah;
  @JsonKey(name: 'keamanan')
  final int keamanan;
  @JsonKey(name: 'admin')
  final int admin;
  @JsonKey(name: 'sub_total_tagihan')
  final int sub_total_tagihan;
  @JsonKey(name: 'denda')
  final int denda;
  @JsonKey(name: 'grand_total')
  final int grand_total;
  @JsonKey(name: 'date')
  final String date;
  @JsonKey(name: 'status')
  final int status;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'username')
  final String username;

  Tagihan(
      this.id,
      this.user_id,
      this.stan_meter_awal,
      this.stan_meter_akhir,
      this.penggunaan,
      this.tagihan_air,
      this.sampah,
      this.keamanan,
      this.admin,
      this.sub_total_tagihan,
      this.denda,
      this.grand_total,
      this.date,
      this.status,
      this.name,
      this.username);

  factory Tagihan.fromJson(Map<String, dynamic> json) =>
      _$TagihanFromJson(json);

  Map<String, dynamic> toJson() => _$TagihanToJson(this);
}

class HomeMenu {
  final String id;
  final String title;
  final String icon;

  HomeMenu(this.id, this.title, this.icon);
}

@JsonSerializable()
class Inbox {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'user_id')
  final int user_id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'date')
  final String date;
  bool isExpanded = false;

  Inbox(this.id, this.user_id, this.title, this.message, this.date, this.isExpanded);

  factory Inbox.fromJson(Map<String, dynamic> json) => _$InboxFromJson(json);

  Map<String, dynamic> toJson() => _$InboxToJson(this);
}
