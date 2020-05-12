import 'package:aturdompet/screens/income/bulan/income_main.dart';
import 'package:aturdompet/screens/income/hari/income_main.dart';
import 'package:aturdompet/screens/income/minggu/income_main.dart';
import 'package:flutter/material.dart';

class IncomeMain extends StatefulWidget {
  @override
  _IncomeMainState createState() => _IncomeMainState();
}

class _IncomeMainState extends State<IncomeMain> {
  @override
  Widget build(BuildContext context) {
    final _kTabs = <Tab>[
      Tab(text: 'Harian'),
      Tab(text: 'Mingguan'),
      Tab(text: 'Bulanan'),
    ];

    final _kTabPages = <Widget>[
      IncomeMainHari(),
      IncomeMainMinggu(),
      IncomeMainBulan(),
    ];

    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(title: Text('Income'), bottom: TabBar(tabs: _kTabs)),
        body: TabBarView(children: _kTabPages),
      ),
    );
  }
}
