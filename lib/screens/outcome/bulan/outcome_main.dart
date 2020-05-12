import 'package:aturdompet/constants.dart';
import 'package:aturdompet/core/view_model/outcome/outcome_bulan.dart';
import 'package:aturdompet/screens/outcome/bulan/add_outcome.dart';
import 'package:aturdompet/screens/outcome/bulan/outcome_list.dart';
import 'package:flutter/material.dart';

class OutcomeMainBulan extends StatefulWidget {
  @override
  _OutcomeMainBulanState createState() => _OutcomeMainBulanState();
}

class _OutcomeMainBulanState extends State<OutcomeMainBulan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Total Bulanan : Rp ${formatter.format(OutcomeBulanViewModel.sumTotal()).toString()}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: OutcomeListBulan()),
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
