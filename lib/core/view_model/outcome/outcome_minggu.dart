import 'package:aturdompet/core/models/outcome/outcome_minggu.dart';
import 'package:hive/hive.dart';

class OutcomeMingguViewModel {

  static final outcomeBox = Hive.box("outcome_minggu");
  
  static Future openBox() {
    return Hive.openBox("outcome_minggu");
  }

  static int sumTotal() {
    int total = 0;
    for(int i=0; i<outcomeBox.length; i++) {
      final outcome = outcomeBox.getAt(i) as OutcomeMinggu;
      total += outcome.value;
    }

    return total;
  }

  static void add(OutcomeMinggu outcome) {
    outcomeBox.add(outcome);
  }

  static Box<dynamic> getall() {
    return outcomeBox;
  }

  static OutcomeMinggu getAt(int index) {
    return outcomeBox.getAt(index) as OutcomeMinggu;
  }

  static void remove(int index) {
    outcomeBox.deleteAt(index);
  }

  static void update(OutcomeMinggu outcome, int index) {
    outcomeBox.putAt(index, outcome);
  }
}