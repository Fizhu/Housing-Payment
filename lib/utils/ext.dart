import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class Ext {
  static handleError(String toastMessage, String errorMessage) {
    toast(toastMessage);
    log(errorMessage);
  }

  static toast(String message) {
    Fluttertoast.showToast(
        msg: message, backgroundColor: Colors.white, textColor: Colors.black);
  }

  static showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                new CircularProgressIndicator(),
                new SizedBox(
                  width: 24.0,
                ),
                new Text("Loading..."),
              ],
            ),
          ),
        );
      },
    );
  }

  static dismissLoading(BuildContext context) => Navigator.pop(context);

  static matchParentHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static matchParentWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static String toRupiah(int nominal) {
    final formatCurrency =
        new NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);
    return formatCurrency.format(nominal);
  }

  static String toCommaFormat(int nominal) {
    final formatCurrency = new NumberFormat.simpleCurrency(
        locale: 'id_ID', decimalDigits: 0, name: '');
    return formatCurrency.format(nominal);
  }

  static String parseStringDate(String date, String dateFormat) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat(dateFormat).format(dateTime).toString();
  }

  static const DATE_FORMAT_MMMM_YYYY = 'MMMM yyyy';
  static const DATE_FORMAT_DD_MM_YYY = 'dd-MM-yyyy';
}
