import 'package:flutter/material.dart';
import 'package:housing_payment/data/models/data.dart';

class InboxPage extends StatefulWidget {
  static const routeName = '/inbox';
  const InboxPage({Key? key}) : super(key: key);

  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(
        child: ,
      ),
    );
  }

  AppBar _appBar() => AppBar(
    title: Text(
        'Inbox'),
  );

  _listHistory(BuildContext context, List<Inbox> list) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        var data = list[index];
        return Container(
          child: InkWell(
            splashColor: Colors.redAccent.withAlpha(30),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailTagihanPage(tagihan: data)));
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.credit_card_rounded,
                        color: Colors.white70,
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Tagihan ${Ext.parseStringDate(data.date, Ext.DATE_FORMAT_MMMM_YYYY)}'),
                          SizedBox(
                            height: 4.0,
                          ),
                          _textStatus(data.status)
                        ],
                      )
                    ],
                  ),
                ),
                Divider(height: 2.0)
              ],
            ),
          ),
        );
      },
      itemCount: list.length,
    );
  }


}
