import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housing_payment/data/models/data.dart';
import 'package:housing_payment/utils/ext.dart';

class WidgetTagihan {
  static widgetContent(Tagihan tagihan) => Row(
        children: [
          Expanded(
              flex: 1,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _leftContent(tagihan))),
          Expanded(
              flex: 1,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _rightContent(tagihan))),
        ],
      );

  static _textTitle(String text) => Text(
        text,
        style: TextStyle(fontSize: 12.0, color: Colors.red[200]),
      );

  static List<Widget> _itemContent(String title, String value) => [
        _textTitle(title),
        SizedBox(
          height: 4.0,
        ),
        Text(value),
      ];

  static _leftContent(Tagihan tagihan) {
    List<Widget> list = [];
    list.addAll(_itemContent(
        "Stan Meter Awal", Ext.toCommaFormat(tagihan.stan_meter_awal)));
    list.add(SizedBox(
      height: 16.0,
    ));
    list.addAll(_itemContent(
        "Stan Meter Akhir", Ext.toCommaFormat(tagihan.stan_meter_akhir)));
    list.add(SizedBox(
      height: 16.0,
    ));
    list.addAll(
        _itemContent("Penggunaa (m3)", Ext.toCommaFormat(tagihan.penggunaan)));
    list.add(SizedBox(
      height: 16.0,
    ));
    list.addAll(_itemContent("Tagihan Air", Ext.toRupiah(tagihan.tagihan_air)));
    list.add(SizedBox(
      height: 16.0,
    ));
    list.addAll(_itemContent("Sampah", Ext.toRupiah(tagihan.sampah)));
    return list;
  }

  static _rightContent(Tagihan tagihan) {
    List<Widget> list = [];
    list.addAll(_itemContent("Keamanan", Ext.toRupiah(tagihan.keamanan)));
    list.add(SizedBox(
      height: 16.0,
    ));
    list.addAll(_itemContent("Admin", Ext.toRupiah(tagihan.admin)));
    list.add(SizedBox(
      height: 16.0,
    ));
    list.addAll(_itemContent(
        "Sub Total Tagihan", Ext.toRupiah(tagihan.sub_total_tagihan)));
    list.add(SizedBox(
      height: 16.0,
    ));
    list.addAll(_itemContent("Denda", Ext.toRupiah(tagihan.denda)));
    list.add(SizedBox(
      height: 16.0,
    ));
    list.addAll(_itemContent("Grand Total", Ext.toRupiah(tagihan.grand_total)));
    return list;
  }

  static statusTagihan(BuildContext context, Tagihan tagihan) {
    if (tagihan.status == 0) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          color: Colors.red[400],
        ),
        width: Ext.matchParentWidth(context),
        padding: EdgeInsets.all(16.0),
        child: Center(
            child: Text(
              'Belum Dibayar',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
      );
    } else if (tagihan.status == 1) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          color: Colors.blue[400],
        ),
        width: Ext.matchParentWidth(context),
        padding: EdgeInsets.all(16.0),
        child: Center(
            child: Text(
              'Menunggu Konfirmasi',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          color: Colors.green[400],
        ),
        width: Ext.matchParentWidth(context),
        padding: EdgeInsets.all(16.0),
        child: Center(
            child: Text(
              'Telah Dibayar',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
      );
    }
  }
}
