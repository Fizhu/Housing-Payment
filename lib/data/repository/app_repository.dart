import 'package:dio/dio.dart';
import 'package:housing_payment/data/models/data.dart';
import 'package:housing_payment/data/pref/pref.dart';
import 'package:housing_payment/data/remote/rest_client.dart';
import 'package:housing_payment/data/repository/repository.dart';

class AppRepository implements Repository {
  RestClient _restClient;

  AppRepository() {
    _restClient = RestClient(Dio());
  }

  @override
  Future<ResponseData> login(String email, String password) async =>
      _restClient.login(email, password);

  @override
  Future<User> getUser() async => UserPref.getUser();

  @override
  saveUser(User user) async => UserPref.setUser(user);

}
