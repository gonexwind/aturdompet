import 'package:hive/hive.dart';

part 'income_bulan.g.dart';

@HiveType()
class IncomeBulan {
  @HiveField(0)
  String desc;

  @HiveField(1)
  int value;

  @HiveField(2)
  DateTime date;

  IncomeBulan(this.desc, this.value, this.date);
}