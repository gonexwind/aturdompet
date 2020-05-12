import 'package:hive/hive.dart';

part 'outcome_hari.g.dart';

@HiveType()
class OutcomeHari {
  @HiveField(0)
  String desc;

  @HiveField(1)
  int value;

  @HiveField(2)
  DateTime date;

  OutcomeHari(this.desc, this.value, this.date);
}