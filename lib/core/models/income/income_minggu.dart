import 'package:hive/hive.dart';

part 'income_minggu.g.dart';

@HiveType()
class IncomeMinggu {
  @HiveField(0)
  String desc;

  @HiveField(1)
  int value;

  @HiveField(2)
  DateTime date;

  IncomeMinggu(this.desc, this.value, this.date);
}