// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://ec2-23-21-216-153.compute-1.amazonaws.com:3000/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<ResponseData<dynamic>> login(username, password) async {
    ArgumentError.checkNotNull(username, 'username');
    ArgumentError.checkNotNull(password, 'password');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'username': username, 'password': password};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('user/login',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{
              r'Access-Control-Allow-Origin': '*',
              r'Vary': 'Origin',
              r'Access-Control-Allow-Headers':
                  'Content-Type, Origin, Accept, token',
              r'Access-Control-Allow-Methods': 'GET, POST, OPTIONS'
            },
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = ResponseData<dynamic>.fromJson(_result.data);
    return value;
  }
}
