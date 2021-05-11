import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:housing_payment/utils/app_assets.dart';
import 'package:housing_payment/utils/ext.dart';

class CsPage extends StatefulWidget {
  static const routeName = '/cs';

  @override
  _CsPageState createState() => _CsPageState();
}

class _CsPageState extends State<CsPage> {

  double _getHeight() {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return MediaQuery.of(context).size.height / 2;
    } else {
      return MediaQuery.of(context).size.height / 5;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      body: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: Ext.matchParentHeight(context)),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: Ext.matchParentWidth(context),
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: _getHeight(),
                                child: SvgPicture.asset(
                                  AppAssets.illust_voice_control,
                                  semanticsLabel: AppAssets.illust_voice_control,
                                ),
                              ),
                              SizedBox(height: 24.0,),
                              Text(
                                'Customer Service',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.0,),
                              Text('Untuk pengaduan dan pertanyaan seputar pembayaran, anda dapat menhubungi melalui WhatsApp ke nomor berikut :',
                              textAlign: TextAlign.center,),
                              SizedBox(height: 16.0,),
                              Text(
                                '0899-4660-004',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red[200]
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
      ),
    );
  }
}
