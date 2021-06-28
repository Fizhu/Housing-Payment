import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housing_payment/data/models/data.dart';
import 'package:housing_payment/utils/Sizes.dart';
import 'package:housing_payment/utils/ext.dart';
import 'package:housing_payment/widget/widget_tagihan.dart';

class TagihanPage extends StatefulWidget {
  static const routeName = '/tagihan';

  @override
  _TagihanPageState createState() => _TagihanPageState();
}

class _TagihanPageState extends State<TagihanPage> {
  AppBar _appBar() => AppBar(
        title: Text('Cek Tagihan'),
      );

  Widget _tagihanContent(Tagihan tagihan) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          child: Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 64.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Rincian Tagihan ${Ext.parseStringDate(tagihan.date, Ext.DATE_FORMAT_MMMM_YYYY)}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  WidgetTagihan.widgetContent(tagihan),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    'Status Pembayaran',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  WidgetTagihan.statusTagihan(context, tagihan)
                ],
              ),
            ),
          ),
        ),
        if (tagihan.status == 0) _buttonPay(),
      ],
    );
  }

  Widget _buttonPay() => Positioned(
        bottom: 0.0,
        right: 0.0,
        left: 0.0,
        child: SizedBox(
          width: Sizes.matchParentWidth(context),
          child: ElevatedButton(
            onPressed: () {
              Ext.toast('This feature under development');
            },
            child: Text(
              'BAYAR SEKARANG',
              style: TextStyle(
                  color: Colors.grey[900], fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.grey,
                padding: EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)))),
          ),
        ),
      );

  _tagihanDUmmy() => Tagihan(
      1,
      1,
      10000,
      40000,
      2314124,
      2451334,
      1999999,
      217877,
      124124,
      1435325,
      123124,
      543634,
      '2021-05-15',
      0,
      'Fizhu',
      'fizhu');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(child: _tagihanContent(_tagihanDUmmy())),
    );
  }
}
