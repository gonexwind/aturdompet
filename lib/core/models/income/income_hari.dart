import 'package:hive/hive.dart';

part 'income_hari.g.dart';

@HiveType()
class IncomeHari {
  @HiveField(0)
  String desc;

  @HiveField(1)
  int value;

  @HiveField(2)
  DateTime date;

  IncomeHari(this.desc, this.value, this.date);
}