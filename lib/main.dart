import 'package:aturdompet/screens/home_screen.dart';
import 'package:aturdompet/screens/income/income_main.dart';
import 'package:aturdompet/screens/outcome/outcome_main.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:aturdompet/core/models/outcome/outcome_hari.dart';
import 'package:aturdompet/core/models/outcome/outcome_minggu.dart';
import 'package:aturdompet/core/models/outcome/outcome_bulan.dart';
import 'package:aturdompet/core/models/income/income_hari.dart';
import 'package:aturdompet/core/models/income/income_minggu.dart';
import 'package:aturdompet/core/models/income/income_bulan.dart';

Future<void> _openBoxes() async {
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(IncomeHariAdapter(), 0);
  Hive.registerAdapter(IncomeMingguAdapter(), 1);
  Hive.registerAdapter(IncomeBulanAdapter(), 2);
  Hive.registerAdapter(OutcomeHariAdapter(), 3);
  Hive.registerAdapter(OutcomeMingguAdapter(), 4);
  Hive.registerAdapter(OutcomeBulanAdapter(), 5);

  await Future.wait([
    Hive.openBox('income_hari'),
    Hive.openBox('income_minggu'),
    Hive.openBox('income_bulan'),
    Hive.openBox('outcome_hari'),
    Hive.openBox('outcome_minggu'),
    Hive.openBox('outcome_bulan'),
  ]);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _openBoxes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins-Medium'),
      routes: {
        '/': (BuildContext context) => HomeScreen(),
        '/income': (BuildContext context) => IncomeMain(),
        '/outcome': (BuildContext context) => OutcomeMain(),
      },
    );
  }
}
