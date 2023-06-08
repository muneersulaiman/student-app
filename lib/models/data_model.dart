import 'package:hive_flutter/adapters.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String age;

  @HiveField(3)
  String phone;

  @HiveField(4)
  String email;

  StudentModel(
      {required this.name,
      required this.age,
      required this.phone,
      required this.email,
      this.id});
}
