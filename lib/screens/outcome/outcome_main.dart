import 'package:aturdompet/screens/outcome/bulan/outcome_main.dart';
import 'package:aturdompet/screens/outcome/hari/outcome_main.dart';
import 'package:aturdompet/screens/outcome/minggu/outcome_main.dart';
import 'package:flutter/material.dart';

class OutcomeMain extends StatefulWidget {
  @override
  _OutcomeMainState createState() => _OutcomeMainState();
}

class _OutcomeMainState extends State<OutcomeMain> {
  @override
  Widget build(BuildContext context) {
    final _kTabs = <Tab>[
      Tab(text: 'Harian'),
      Tab(text: 'Mingguan'),
      Tab(text: 'Bulanan'),
    ];

    final _kTabPages = <Widget>[
      OutcomeMainHari(),
      OutcomeMainMinggu(),
      OutcomeMainBulan(),
    ];

    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(title: Text('Outcome'), bottom: TabBar(tabs: _kTabs)),
        body: TabBarView(children: _kTabPages),
      ),
    );
  }
}
