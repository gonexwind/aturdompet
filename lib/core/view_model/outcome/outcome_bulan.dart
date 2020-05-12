import 'package:aturdompet/core/models/outcome/outcome_bulan.dart';
import 'package:hive/hive.dart';

class OutcomeBulanViewModel {

  static final outcomeBox = Hive.box("outcome_bulan");
  
  static Future openBox() {
    return Hive.openBox("outcome_bulan");
  }

  static int sumTotal() {
    int total = 0;
    for(int i=0; i<outcomeBox.length; i++) {
      final outcome = outcomeBox.getAt(i) as OutcomeBulan;
      total += outcome.value;
    }

    return total;
  }

  static void add(OutcomeBulan outcome) {
    outcomeBox.add(outcome);
  }

  static Box<dynamic> getall() {
    return outcomeBox;
  }

  static OutcomeBulan getAt(int index) {
    return outcomeBox.getAt(index) as OutcomeBulan;
  }

  static void remove(int index) {
    outcomeBox.deleteAt(index);
  }

  static void update(OutcomeBulan outcome, int index) {
    outcomeBox.putAt(index, outcome);
  }
}