import 'package:aturdompet/constants.dart';
import 'package:aturdompet/core/view_model/income/income_bulan.dart';
import 'package:aturdompet/core/view_model/income/income_hari.dart';
import 'package:aturdompet/core/view_model/income/income_minggu.dart';
import 'package:aturdompet/core/view_model/outcome/outcome_bulan.dart';
import 'package:aturdompet/core/view_model/outcome/outcome_hari.dart';
import 'package:aturdompet/core/view_model/outcome/outcome_minggu.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Atur Dompet'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Container(
                child: createChart(context),
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5.0),
            _buildBalance(),
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  _buildIncome(),
                  _buildOutcome(),
                ],
              ),
            ),
          ],
        ));
  }

  Widget createChart(BuildContext context) {
    return charts.PieChart(_createSampleData(),
        animate: true,
        defaultRenderer: new charts.ArcRendererConfig(
            arcWidth: 60,
            arcRendererDecorators: [new charts.ArcLabelDecorator()]));
  }

  Widget _buildBalance() {
    return Expanded(
      flex: 2,
      child: Card(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Rp ${formatter.format((IncomeHariViewModel.sumTotal() + IncomeMingguViewModel.sumTotal() + IncomeBulanViewModel.sumTotal()) - (OutcomeHariViewModel.sumTotal() + OutcomeMingguViewModel.sumTotal() + OutcomeBulanViewModel.sumTotal())).toString()}",
                style: TextStyle(
                    fontSize: 30.0, color: Theme.of(context).accentColor),
              ),
              Text('Balance')
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIncome() {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/income'),
        child: Card(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "+ Rp ${formatter.format((IncomeHariViewModel.sumTotal() + IncomeMingguViewModel.sumTotal() + IncomeBulanViewModel.sumTotal())).toString()}",
                  style: TextStyle(
                      fontSize: 20.0, color: Theme.of(context).accentColor),
                ),
                Text('Income')
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOutcome() {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/outcome'),
        child: Card(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "- Rp ${formatter.format((OutcomeHariViewModel.sumTotal() + OutcomeMingguViewModel.sumTotal() + OutcomeBulanViewModel.sumTotal())).toString()}",
                  style: TextStyle(fontSize: 20.0, color: Colors.red),
                ),
                Text('Outcome')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<charts.Series<Balance, int>> _createSampleData() {
  final data = [
    Balance(
        'Income',
        (IncomeHariViewModel.sumTotal() +
            IncomeMingguViewModel.sumTotal() +
            IncomeBulanViewModel.sumTotal())),
    Balance(
        'Outcome',
        (OutcomeHariViewModel.sumTotal() +
            OutcomeMingguViewModel.sumTotal() +
            OutcomeBulanViewModel.sumTotal())),
  ];

  return [
    new charts.Series<Balance, int>(
      id: 'Balance',
      colorFn: (_, pos) {
        if (pos % 2 == 0) return charts.MaterialPalette.teal.shadeDefault;
        return charts.MaterialPalette.red.shadeDefault;
      },
      domainFn: (Balance data, _) => data.total,
      measureFn: (Balance data, _) => data.total,
      data: data,
      // Set a label accessor to control the text of the arc label.
      labelAccessorFn: (Balance row, _) => '${row.name}',
    )
  ];
}

/// Sample linear data type.
class Balance {
  final String name;
  final int total;

  Balance(this.name, this.total);
}
