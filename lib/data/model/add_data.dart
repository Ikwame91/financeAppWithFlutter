// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive/hive.dart';

part 'add_data.g.dart';

@HiveType(typeId: 1)
class AddData extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String explain;
  @HiveField(2)
  String amont;
  @HiveField(3)
  String choice;
  @HiveField(4)
  DateTime dateTime;
  AddData({
    required this.name,
    required this.explain,
    required this.amont,
    required this.choice,
    required this.dateTime,
  });
}
