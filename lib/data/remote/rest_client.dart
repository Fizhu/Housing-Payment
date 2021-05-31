import 'package:dio/dio.dart' hide Headers;
import 'package:housing_payment/data/models/data.dart';
import 'package:housing_payment/utils/app_constant.dart';
import 'package:retrofit/retrofit.dart';

import 'api_endpoint.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: AppConstant.BASE_URL_IP)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  static const headers = <String, dynamic>{
    "Access-Control-Allow-Origin": "*",
    "Vary": "Origin",
    "Access-Control-Allow-Headers": "Content-Type, Origin, Accept, token",
    "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  };


  @POST(ApiEndpoint.ENDPOINT_LOGIN)
  @FormUrlEncoded()
  @Headers(headers)
  Future<ResponseData> login(
      @Field("username") String username, @Field("password") String password);

}
