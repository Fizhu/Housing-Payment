import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housing_payment/data/models/data.dart';

class HistoryPage extends StatefulWidget {
  static const routeName = '/history';

  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    List<Tagihan> listdummy = [
      _tagihanDummy(0),
      _tagihanDummy(1),
      _tagihanDummy(2),
      _tagihanDummy(0),
      _tagihanDummy(1),
      _tagihanDummy(2),
      _tagihanDummy(0),
      _tagihanDummy(1),
      _tagihanDummy(2),
    ];
    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(
        child: _listHistory(context, listdummy),
      ),
    );
  }

  AppBar _appBar() => AppBar(
        title: Text('History'),
      );

  _textStatus(int status) {
    if (status == 1) {
      return Text(
        'Menunggu Konfirmasi',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[400]),
      );
    } else if (status == 2) {
      return Text(
        'Telah Dibayar',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green[400]),
      );
    } else {
      return Text(
        'Belum Dibayar',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red[400]),
      );
    }
  }

  _listHistory(BuildContext context, List<Tagihan> list) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      var data = list[index];
      return Container(
        child: InkWell(
          splashColor: Colors.blueAccent.withAlpha(30),
          onTap: () {
            //handle onclick;
          },
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.credit_card_rounded,
                    color: Colors.grey[900],
                  ),
                  Column(
                    children: [
                      Text(
                          'Tagihan ${DateTime.parse(data.date).month} ${DateTime.parse(data.date).year}'),
                      _textStatus(data.status)
                    ],
                  )
                ],
              ),
              Divider()
            ],
          ),
        ),
      );
    });
  }

  _tagihanDummy(int? status) => Tagihan(
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
      status ?? 0,
      'Fizhu',
      'fizhu');
}
