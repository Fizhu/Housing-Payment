import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housing_payment/utils/ext.dart';
import 'package:intl/intl.dart';

class TagihanPage extends StatefulWidget {
  static const routeName = '/tagihan';

  @override
  _TagihanPageState createState() => _TagihanPageState();
}

class _TagihanPageState extends State<TagihanPage> {
  DateTime _now = DateTime.now();
  DateFormat _formatter = DateFormat('MMM yyyy');
  DateFormat _sortFormatter = DateFormat('yyyy-MM');

  AppBar _appBar() => AppBar(
        title: Text('Cek Tagihan'),
      );

  Text _textTitle(String text) => Text(
        text,
        style: TextStyle(fontSize: 12.0, color: Colors.red[200]),
      );

  Widget _tagihanContent() {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: Ext.matchParentHeight(context) -
                _appBar().preferredSize.height -
                (16.0 * 2)),
        child: IntrinsicHeight(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Rincian Tagihan ' + _formatter.format(_now),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 24.0,),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _textTitle('Stan Meter Awal'),
                            SizedBox(height: 4.0,),
                            Text('20.000'),
                          ],
                        )),
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _textTitle('Stan Meter Keamanan'),
                            SizedBox(height: 4.0,),
                            Text('20.000'),
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(
        child: _tagihanContent()
      ),
    );
  }
}
