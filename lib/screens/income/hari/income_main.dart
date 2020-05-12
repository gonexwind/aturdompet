import 'package:aturdompet/constants.dart';
import 'package:aturdompet/core/view_model/income/income_hari.dart';
import 'package:aturdompet/screens/income/hari/add_income.dart';
import 'package:aturdompet/screens/income/hari/income_list.dart';
import 'package:flutter/material.dart';

class IncomeMainHari extends StatefulWidget {
  @override
  _IncomeMainHariState createState() => _IncomeMainHariState();
}

class _IncomeMainHariState extends State<IncomeMainHari> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Total Harian : Rp ${formatter.format(IncomeHariViewModel.sumTotal()).toString()}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: IncomeListHari()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: AddIncome(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
