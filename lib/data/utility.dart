import 'package:finance_app/data/model/add_data.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

int totals = 0;

final box = Hive.box<AddData>('data');

int total() {
  var history2 = box.values.toList();
  List income = [];
  for (var i = 0; i < history2.length; i++) {
    try {
      // If 'isInBox' is "income", add the amount as is; otherwise, add its negation
      // ignore: unrelated_type_equality_checks
      int amount = int.parse(history2[i].amont);
      income.add(history2[i].choice == 'Income' ? amount : -amount);
    } catch (e) {
      // Handling the case where parsing fails
      if (kDebugMode) {
        print("Error parsing amount at index $i: $e");
      }
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
      income.add(history2[i].choice == 'Income' ? amount : 0);
    } catch (e) {
      // Handlng the case where parsing fails
      if (kDebugMode) {
        print("Error parsing amount at index $i: $e");
      }
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
    try {
      a.add(history2[i].choice == 'Income'
          ? 0
          : int.parse(history2[i].amont) * -1);
    } catch (e) {
      if (kDebugMode) {
        print(
            "Error parsing amount at index $i: $e, value: ${history2[i].amont}");
      }
      // Setting a default value (0 in this case).
      a.add(0);
    }
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

List<AddData> today() {
  List<AddData> a = [];
  var history2 = box.values.toList();
  DateTime date = DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    try {
      if (history2[i].dateTime.day == date.day) {
        a.add(history2[i]);
      }
    } catch (e) {
      //Handling error
      if (kDebugMode) {
        print('Error proccessing data at index $i: $e');
      }
    }
  }
  return a;
}

List<AddData> week() {
  List<AddData> a = [];
  var history2 = box.values.toList();
  DateTime date = DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    try {
      if (date.day - 7 <= history2[i].dateTime.day &&
          history2[i].dateTime.day <= date.day) {
        a.add(history2[i]);
      }
    } catch (e) {
      //Handling error
      if (kDebugMode) {
        print('Error proccessing data at index $i: $e');
      }
    }
  }
  return a;
}

List<AddData> month() {
  List<AddData> a = [];
  var history2 = box.values.toList();
  DateTime date = DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    try {
      if (history2[i].dateTime.month == date.month) {
        a.add(history2[i]);
      }
    } catch (e) {
      //Handling error
      if (kDebugMode) {
        print('Error proccessing data at index $i: $e');
      }
    }
  }
  return a;
}

List<AddData> year() {
  List<AddData> a = [];
  var history2 = box.values.toList();
  DateTime date = DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    try {
      if (history2[i].dateTime.year == date.year) {
        a.add(history2[i]);
      }
    } catch (e) {
      //Handling error
      if (kDebugMode) {
        print('Error proccessing data at index $i: $e');
      }
    }
  }
  return a;
}

int totalChart(List<AddData> history2) {
  List a = [0, 0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].choice == 'Income'
        ? int.parse(history2[i].amont)
        : int.parse(history2[i].amont) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

List time(List<AddData> history2, bool hour) {
  List<AddData> a = [];
  List total = [0, 0];
  int counter = 0;
  for (var c = 0; c < history2.length; c++) {
    for (var i = c; i < history2.length; i++) {
      if (hour) {
        if (history2[i].dateTime.hour == history2[c].dateTime.hour) {
          a.add(history2[i]);
          counter = i;
        }
      } else {
        if (history2[i].dateTime.day == history2[c].dateTime.day) {
          a.add(history2[i]);
          counter = i;
        }
      }
    }
    total.add(totalChart(a));
    a.clear();
    c = counter;
  }
  if (kDebugMode) {
    print(total);
  }
  return total;
}






