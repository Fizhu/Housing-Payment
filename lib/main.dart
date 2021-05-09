import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housing_payment/bloc/bloc_observer.dart';
import 'package:housing_payment/data/pref/pref.dart';
import 'package:housing_payment/ui/home/home.dart';
import 'package:housing_payment/ui/login/login.dart';

import 'bloc/user/user_bloc.dart';
import 'data/repository/app_repository.dart';

String _route = LoginPage.routeName;
bool _isLogin;

Future<void> main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  _isLogin = await UserPref.getStatus();
  if (_isLogin) {
    _route = HomePage.routeName;
  } else {
    _route = LoginPage.routeName;
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Housing Payment',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        accentColor: Colors.orangeAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: _route,
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        HomePage.routeName: (context) => BlocProvider(
              create: (context) => UserBloc(repository: AppRepository()),
              child: HomePage(),
            ),
      },
    );
  }
}
