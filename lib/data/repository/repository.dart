import 'package:housing_payment/data/models/data.dart';

abstract class Repository {
  Future<ResponseData> login(String email, String password);

  Future<User> getUser();

  saveUser(User user);
}
