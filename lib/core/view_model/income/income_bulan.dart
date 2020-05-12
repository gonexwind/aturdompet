import 'package:aturdompet/core/models/income/income_bulan.dart';
import 'package:hive/hive.dart';

class IncomeBulanViewModel {

  static final incomeBox = Hive.box("income_bulan");
  
  static Future openBox() {
    return Hive.openBox("income_bulan");
  }

  static int sumTotal() {
    int total = 0;
    for(int i=0; i<incomeBox.length; i++) {
      final income = incomeBox.getAt(i) as IncomeBulan;
      total += income.value;
    }

    return total;
  }

  static void add(IncomeBulan income) {
    incomeBox.add(income);
  }

  static Box<dynamic> getall() {
    return incomeBox;
  }

  static IncomeBulan getAt(int index) {
    return incomeBox.getAt(index) as IncomeBulan;
  }

  static void remove(int index) {
    incomeBox.deleteAt(index);
  }

  static void update(IncomeBulan income, int index) {
    incomeBox.putAt(index, income);
  }
}