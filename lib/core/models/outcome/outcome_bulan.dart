import 'package:hive/hive.dart';

part 'outcome_bulan.g.dart';

@HiveType()
class OutcomeBulan {
  @HiveField(0)
  String desc;

  @HiveField(1)
  int value;

  @HiveField(2)
  DateTime date;

  OutcomeBulan(this.desc, this.value, this.date);
}