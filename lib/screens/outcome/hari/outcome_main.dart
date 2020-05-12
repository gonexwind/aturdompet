import 'package:aturdompet/constants.dart';
import 'package:aturdompet/core/view_model/outcome/outcome_hari.dart';
import 'package:aturdompet/screens/outcome/hari/add_outcome.dart';
import 'package:aturdompet/screens/outcome/hari/outcome_list.dart';
import 'package:flutter/material.dart';

class OutcomeMainHari extends StatefulWidget {
  @override
  _OutcomeMainHariState createState() => _OutcomeMainHariState();
}

class _OutcomeMainHariState extends State<OutcomeMainHari> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              "Total Harian : Rp ${formatter.format(OutcomeHariViewModel.sumTotal()).toString()}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: OutcomeListHari()),
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
