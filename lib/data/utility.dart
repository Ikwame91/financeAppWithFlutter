import 'package:finance_app/data/model/add_data.dart';
import 'package:hive/hive.dart';

int totals = 0;

final box = Hive.box<AddData>('data');

int total() {
  var history2 = box.values.toList();
  List income = [];
  for (var i = 0; i < history2.length; i++) {
    try {
      int amount = int.parse(history2[i].amont);

      // If 'isInBox' is "income", add the amount as is; otherwise, add its negation
      // ignore: unrelated_type_equality_checks
      income.add(history2[i].choice == 'Income' ? amount : -amount);
    } catch (e) {
      // Handlng the case where parsing fails
      print("Error parsing amount at index $i: $e");
    }
  }
  if (income.isNotEmpty) {
    totals = income.reduce((value, element) => value + element);
  } else {
    totals = 0;
  }

  return totals;
}

int income() {
  var history2 = box.values.toList();
  List income = [];
  for (var i = 0; i < history2.length; i++) {
    try {
      int amount = int.parse(history2[i].amont);

      // If 'isInBox' is "income", add the amount as is; otherwise, add its negation
      // ignore: unrelated_type_equality_checks
      income.add(history2[i].choice == 'Income' ? amount : 0);
    } catch (e) {
      // Handlng the case where parsing fails
      print("Error parsing amount at index $i: $e");
    }
  }
  if (income.isNotEmpty) {
    totals = income.reduce((value, element) => value + element);
  } else {
    totals = 0;
  }

  return totals;
}

int expenses() {
  var history2 = box.values.toList();
  List a = [0, 0];
  for (var i = 0; i < history2.length; i++) {
    a.add(
        history2[i].choice == 'Income' ? 0 : int.parse(history2[i].amont) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}
