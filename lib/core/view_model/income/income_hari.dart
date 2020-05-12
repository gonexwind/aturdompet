import 'package:aturdompet/core/models/income/income_hari.dart';
import 'package:hive/hive.dart';

class IncomeHariViewModel {

  static final incomeBox = Hive.box("income_hari");
  
  static Future openBox() {
    return Hive.openBox("income_hari");
  }

  static int sumTotal() {
    int total = 0;
    for(int i=0; i<incomeBox.length; i++) {
      final income = incomeBox.getAt(i) as IncomeHari;
      total += income.value;
    }

    return total;
  }

  static void add(IncomeHari income) {
    incomeBox.add(income);
  }

  static Box<dynamic> getall() {
    return incomeBox;
  }

  static IncomeHari getAt(int index) {
    return incomeBox.getAt(index) as IncomeHari;
  }

  static void remove(int index) {
    incomeBox.deleteAt(index);
  }

  static void update(IncomeHari income, int index) {
    incomeBox.putAt(index, income);
  }
}