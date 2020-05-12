import 'package:aturdompet/constants.dart';
import 'package:aturdompet/core/view_model/income/income_minggu.dart';
import 'package:aturdompet/screens/income/minggu/add_income.dart';
import 'package:aturdompet/screens/income/minggu/income_list.dart';
import 'package:flutter/material.dart';

class IncomeMainMinggu extends StatefulWidget {
  @override
  _IncomeMainMingguState createState() => _IncomeMainMingguState();
}

class _IncomeMainMingguState extends State<IncomeMainMinggu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Total Mingguan : Rp ${formatter.format(IncomeMingguViewModel.sumTotal()).toString()}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: IncomeListMinggu()),
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
