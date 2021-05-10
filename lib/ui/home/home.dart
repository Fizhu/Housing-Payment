import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:housing_payment/bloc/user/user_bloc.dart';
import 'package:housing_payment/data/models/data.dart';
import 'package:housing_payment/data/pref/pref.dart';
import 'package:housing_payment/ui/login/login.dart';
import 'package:housing_payment/utils/app_assets.dart';
import 'package:housing_payment/utils/ext.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HomeMenu> _listAdminMenu = [
    HomeMenu("Input Tagihan", AppAssets.ic_pen),
    HomeMenu("List Tagihan", AppAssets.ic_file13),
    HomeMenu("History", AppAssets.ic_clock),
  ];
  List<HomeMenu> _listWargaMenu = [
    HomeMenu("Cek Tagihan", AppAssets.ic_file17),
    HomeMenu("History", AppAssets.ic_clock),
    HomeMenu("Hubungi Kami", AppAssets.ic_good_feedback),
    HomeMenu("Inbox", AppAssets.ic_mail),
  ];

  Widget _header() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserExisted) {
        return Center(
          child: Center(
            child: Center(
              child: Container(
                height: 64.0,
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FlutterLogo(
                      size: 48.0,
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Selamat Datang,'),
                          Text(
                            state.user.name,
                            style: TextStyle(
                                color: Colors.red[200],
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.exit_to_app_outlined),
                        onPressed: () {
                          _showLogoutDialog();
                        }),
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        return Text('Something went wrong');
      }
    });
  }

  Future<void> _showLogoutDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('OMG, Why?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure want to logout ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Go Ahead'),
              onPressed: () {
                UserPref.clearData();
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginPage.routeName, (r) => false);
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  GridView _createGridMenu(BuildContext context, List<HomeMenu> list) {
    return GridView.builder(
        itemCount: list.isEmpty ? 0 : list.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: _getAspectRatio(),
        ),
        itemBuilder: (context, position) {
          var menu = list[position];
          return Container(
            child: Card(
              color: Colors.red[200],
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: EdgeInsets.all(8.0),
              semanticContainer: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0)),
              child: InkWell(
                splashColor: Colors.orangeAccent.withAlpha(30),
                onTap: () {
                  Ext.toast(menu.title);
                },
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  height: 16.0,
                  child: SvgPicture.asset(
                    menu.icon,
                    semanticsLabel: menu.title,
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget _getListMenu() {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserExisted) {
        if (state.user.role == "admin") {
          return _createGridMenu(context, _listAdminMenu);
        } else {
          return _createGridMenu(context, _listWargaMenu);
        }
      } else {
        return Text('Something went wrong');
      }
    });
  }

  double _getHeight() {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return MediaQuery.of(context).size.height / 2;
    } else {
      return MediaQuery.of(context).size.height / 5;
    }
  }

  double _getAspectRatio() {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return MediaQuery.of(context).size.width /
          MediaQuery.of(context).size.height /
          0.50;
    } else {
      return MediaQuery.of(context).size.width /
          MediaQuery.of(context).size.height /
          0.25;
    }
  }



  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(FetchUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height-(16.0*2)),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _header(),
                  Divider(),
                  SizedBox(
                    height: 16.0,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(48.0, 16.0, 48.0, 16.0),
                      height: _getHeight(),
                      child:
                          BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                        if (state is UserExisted) {
                          if (state.user.role == "admin") {
                            return SvgPicture.asset(
                              AppAssets.illust_data_report,
                              semanticsLabel: AppAssets.illust_data_report,
                            );
                          } else {
                            return SvgPicture.asset(
                              AppAssets.illust_smart_home,
                              semanticsLabel: AppAssets.illust_smart_home,
                            );
                          }
                        } else {
                          return Text('Something went wrong');
                        }
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 250.0,
                    padding: EdgeInsets.all(16.0),
                    child: _getListMenu(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
