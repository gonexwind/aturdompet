import 'package:aturdompet/constants.dart';
import 'package:aturdompet/core/models/outcome/outcome_bulan.dart';
import 'package:aturdompet/core/view_model/outcome/outcome_bulan.dart';
import 'package:aturdompet/screens/outcome/bulan/view_outcome.dart';
import 'package:flutter/material.dart';
import 'package:aturdompet/widgets/custom_icon_decoration.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class OutcomeListBulan extends StatefulWidget {
  @override
  _OutcomeListBulanState createState() => _OutcomeListBulanState();
}

class _OutcomeListBulanState extends State<OutcomeListBulan> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: OutcomeBulanViewModel.openBox(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return _outcomeItem();
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _outcomeItem() {
    double iconSize = 20;

    return WatchBoxBuilder(
      box: OutcomeBulanViewModel.getall(),
      builder: (context, outcomeBox) {
        return ListView.builder(
          itemCount: outcomeBox.length,
          padding: const EdgeInsets.all(0),
          itemBuilder: (context, index) {
            final outcome = OutcomeBulanViewModel.getAt(index);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(children: <Widget>[
                _lineStyle(context, iconSize, index, outcomeBox.length),
                _displayDate(outcome.date),
                SizedBox(width: 10),
                _displayItem(index, outcome, context),
              ]),
            );
          },
        );
      },
    );
  }

  Widget _displayItem(int index, OutcomeBulan outcome, BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Color(0x42000000),
                  offset: Offset(0, 3),
                )
              ]),
          padding: const EdgeInsets.all(14.0),
          child: InkWell(
            onTap: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: ViewOutcome(outcome.desc, outcome.value, outcome.date,
                          index, outcome),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                    );
                  });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Rp ${formatter.format(outcome.value).toString()}",
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(height: 12),
                Text(outcome.desc)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _displayDate(DateTime date) {
    return Container(
        padding: const EdgeInsets.only(left: 8.0),
        width: 90.0,
        child: Text(DateFormat('dd-MM-yyyy').format(date)));
  }

  Widget _lineStyle(
      BuildContext context, double iconSize, int index, int listLength) {
    return Container(
      decoration: CustomIconDecoration(
          iconSize: iconSize,
          lineWidth: 1,
          firstData: index == 0 ?? true,
          lastData: index == listLength - 1 ?? true),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(50), boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Color(0x20000000),
            offset: Offset(0, 3),
          )
        ]),
        child: Icon(
          Icons.fiber_manual_record,
          size: 20,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
