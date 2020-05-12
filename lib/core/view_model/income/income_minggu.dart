import 'package:aturdompet/core/models/income/income_minggu.dart';
import 'package:hive/hive.dart';

class IncomeMingguViewModel {

  static final incomeBox = Hive.box("income_minggu");
  
  static Future openBox() {
    return Hive.openBox("income_minggu");
  }

  static int sumTotal() {
    int total = 0;
    for(int i=0; i<incomeBox.length; i++) {
      final income = incomeBox.getAt(i) as IncomeMinggu;
      total += income.value;
    }

    return total;
  }

  static void add(IncomeMinggu income) {
    incomeBox.add(income);
  }

  static Box<dynamic> getall() {
    return incomeBox;
  }

  static IncomeMinggu getAt(int index) {
    return incomeBox.getAt(index) as IncomeMinggu;
  }

  static void remove(int index) {
    incomeBox.deleteAt(index);
  }

  static void update(IncomeMinggu income, int index) {
    incomeBox.putAt(index, income);
  }
}