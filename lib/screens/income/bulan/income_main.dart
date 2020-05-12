import 'package:aturdompet/constants.dart';
import 'package:aturdompet/core/view_model/income/income_bulan.dart';
import 'package:aturdompet/screens/income/bulan/add_income.dart';
import 'package:aturdompet/screens/income/bulan/income_list.dart';
import 'package:flutter/material.dart';

class IncomeMainBulan extends StatefulWidget {
  @override
  _IncomeMainBulanState createState() => _IncomeMainBulanState();
}

class _IncomeMainBulanState extends State<IncomeMainBulan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Total Bulanan : Rp ${formatter.format(IncomeBulanViewModel.sumTotal()).toString()}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: IncomeListBulan()),
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
