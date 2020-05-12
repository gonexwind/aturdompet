import 'package:hive/hive.dart';

part 'outcome_minggu.g.dart';

@HiveType()
class OutcomeMinggu {
  @HiveField(0)
  String desc;

  @HiveField(1)
  int value;

  @HiveField(2)
  DateTime date;

  OutcomeMinggu(this.desc, this.value, this.date);
}