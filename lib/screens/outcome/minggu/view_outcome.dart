import 'package:aturdompet/constants.dart';
import 'package:aturdompet/core/models/outcome/outcome_minggu.dart';
import 'package:aturdompet/core/view_model/outcome/outcome_minggu.dart';
import 'package:aturdompet/screens/outcome/minggu/edit_outcome.dart';
import 'package:aturdompet/widgets/custom_edit_delete_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ViewOutcome extends StatelessWidget {
  final desc;
  final value;
  final date;
  final int index;
  final OutcomeMinggu outcome;
  ViewOutcome(this.desc, this.value, this.date, this.index, this.outcome);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop())
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                desc,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "Rp ${formatter.format(value).toString()}",
                style: TextStyle(
                    color: Theme.of(context).accentColor, fontSize: 20),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.date_range),
              SizedBox(width: 10),
              Text(DateFormat('dd-MM-yyyy').format(date),
                  style: TextStyle(fontSize: 18)),
            ],
          ),
          SizedBox(height: 12),
          CustomEditDeleteButton(
            onDelete: () {
              OutcomeMingguViewModel.remove(index);
              Navigator.of(context).pop();
            },
            onEdit: () {
              Navigator.of(context).pop();

              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: EditOutcome(outcome: outcome, index: index),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                    );
                  });
            },
          )
        ],
      ),
    );
  }
}
