import 'package:aturdompet/core/models/outcome/outcome_hari.dart';
import 'package:hive/hive.dart';

class OutcomeHariViewModel {
  static final outcomeBox = Hive.box("outcome_hari");

  static Future openBox() {
    return Hive.openBox("outcome_hari");
  }

  static int sumTotal() {
    int total = 0;
    for (int i = 0; i < outcomeBox.length; i++) {
      final outcome = outcomeBox.getAt(i) as OutcomeHari;
      total += outcome.value;
    }

    return total;
  }

  static void add(OutcomeHari outcome) {
    outcomeBox.add(outcome);
  }

  static Box<dynamic> getall() {
    return outcomeBox;
  }

  static OutcomeHari getAt(int index) {
    return outcomeBox.getAt(index) as OutcomeHari;
  }

  static void remove(int index) {
    outcomeBox.deleteAt(index);
  }

  static void update(OutcomeHari outcome, int index) {
    outcomeBox.putAt(index, outcome);
  }
}
