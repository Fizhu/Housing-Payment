import 'package:flutter/material.dart';
import 'package:housing_payment/data/models/data.dart';
import 'package:housing_payment/utils/ext.dart';
import 'package:housing_payment/widget/widget_tagihan.dart';

class DetailTagihanPage extends StatelessWidget {
  static const routeName = '/detail_tagihan';
  final Tagihan tagihan;

  const DetailTagihanPage({Key? key, required this.tagihan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _content(context),
    );
  }

  AppBar _appBar() => AppBar(
        title: Text(
            'Tagihan ${Ext.parseStringDate(tagihan.date, Ext.DATE_FORMAT_MMMM_YYYY)}'),
      );

  _content(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
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
            ],
          ),
        ),
      );
}
