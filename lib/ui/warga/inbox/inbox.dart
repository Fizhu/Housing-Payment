import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:housing_payment/data/models/data.dart';
import 'package:housing_payment/utils/ext.dart';

class InboxPage extends StatefulWidget {
  static const routeName = '/inbox';

  const InboxPage({Key? key}) : super(key: key);

  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  List<Inbox> list = [];

  @override
  void initState() {
    list.clear();
    list.addAll(_inboxDummy(15));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: _listNotif(),
          ),
        ),
      ),
    );
  }

  AppBar _appBar() => AppBar(
        title: Text('Inbox'),
      );

  _listNotif() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          list[index].isExpanded = !isExpanded;
        });
      },
      expandedHeaderPadding: const EdgeInsets.all(0.0),
      children: list.map<ExpansionPanel>((Inbox inbox) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              leading: Icon(
                Icons.credit_card_rounded,
                color: Colors.white70,
              ),
              title: Text(inbox.title),
            );
          },
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  inbox.message,
                  style: TextStyle(fontSize: 14.0),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.bottomRight,
                  child: Text(
                    Ext.parseStringDate(inbox.date, Ext.DATE_FORMAT_DD_MM_YYY),
                    style: TextStyle(color: Colors.white70, fontSize: 12.0),
                  ),
                )
              ],
            ),
          ),
          isExpanded: inbox.isExpanded,
        );
      }).toList(),
    );
  }

  _inboxDummy(int total) {
    List<Inbox> list = [];
    for (; total >= 0; total--) {
      list.add(Inbox(total, total, "Ini notif $total", "Ini Message nya $total",
          '2021-05-15', false));
    }
    return list;
  }
}
