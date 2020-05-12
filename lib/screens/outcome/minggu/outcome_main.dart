import 'package:aturdompet/constants.dart';
import 'package:aturdompet/core/view_model/outcome/outcome_minggu.dart';
import 'package:aturdompet/screens/outcome/minggu/add_outcome.dart';
import 'package:aturdompet/screens/outcome/minggu/outcome_list.dart';
import 'package:flutter/material.dart';

class OutcomeMainMinggu extends StatefulWidget {
  @override
  _OutcomeMainMingguState createState() => _OutcomeMainMingguState();
}

class _OutcomeMainMingguState extends State<OutcomeMainMinggu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Total Mingguan : Rp ${formatter.format(OutcomeMingguViewModel.sumTotal()).toString()}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: OutcomeListMinggu()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: AddOutcome(),
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
