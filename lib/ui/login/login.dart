import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:housing_payment/data/models/data.dart';
import 'package:housing_payment/data/pref/pref.dart';
import 'package:housing_payment/data/remote/rest_client.dart';
import 'package:housing_payment/ui/home/home.dart';
import 'package:housing_payment/utils/app_assets.dart';
import 'package:housing_payment/utils/ext.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false;
  String? _username, _password;
  final _restClient = RestClient(Dio());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  double _getHeight() {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return MediaQuery.of(context).size.height / 2;
    } else {
      return MediaQuery.of(context).size.height / 5;
    }
  }

  _login() async {
    Ext.showLoading(context);
    await _restClient.login(_username?.trim(), _password).then((value) {
      log(value.toJson().toString());
      if (value.status!) {
        Ext.dismissLoading(context);
        if (value.data != null) {
          User _user = User.fromJson(value.data!);
          _successLogin(_user);
        } else {
          Ext.dismissLoading(context);
          Ext.toast(value.message ?? "Something when wrong");
        }
      } else {
        Ext.dismissLoading(context);
        Ext.toast(value.message ?? "");
      }
    }, onError: (e, s) {
      Ext.dismissLoading(context);
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        Ext.handleError('Connection Timeout', e.message);
      } else if (e.type == DioErrorType.other) {
        Ext.handleError(
            'Connection Problem', e.message + '\n' + 'StackTrace : $s');
      } else {
        Ext.handleError(
            'Something when wrong', e.message + '\n' + 'StackTrace : $s');
      }
    });
  }

  void _handleSubmit() async {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      _login();
    }
  }

  void _successLogin(User user) {
    UserPref.setStatus();
    UserPref.setUser(user);
    Navigator.pushReplacementNamed(context, HomePage.routeName);
  }

  Widget _pwFormInput() {
    return Container(
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: !_passwordVisible,
        onSaved: (String? value) {
          _password = value;
        },
        validator: (value) {
          if (value == null) {
            return 'Password is Required';
          } else if (value.isEmpty) {
            return 'Password is Required';
          } else if (value.length < 6) {
            return 'Password should contains more then 5 character';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          labelText: 'Password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          prefixIcon: Icon(
            Icons.lock,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: _getHeight(),
                      child: SvgPicture.asset(
                        AppAssets.illust_login,
                        semanticsLabel: 'illust_login',
                      ),
                    ),
                    SizedBox(
                      height: 56.0,
                    ),
                    Container(
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.characters,
                        onSaved: (String? value) {
                          _username = value;
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Username is Required';
                          } else if (value.isEmpty) {
                            return 'Username is Required';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          prefixIcon: Icon(
                            Icons.mail,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    _pwFormInput(),
                    SizedBox(
                      height: 24.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          textStyle: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          _handleSubmit();
                        },
                        child: Text('Login'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
