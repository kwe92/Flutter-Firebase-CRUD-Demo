import 'package:cloud_firestore/cloud_firestore.dart';

// User Model Class

class UserModel {
  const UserModel(
      {required this.id,
      required this.name,
      required this.age,
      required this.birthdate});
  final String id;
  final String name;
  final int age;
  final DateTime? birthdate;

  // private implementation detail to parse TimeStamp
  static DateTime _fromTimeStamp(Timestamp timestamp) =>
      DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);

  // Factory constructor to create a UserModel Object from a json object passed
  factory UserModel.fromJSON(Map<String, Object?> json) {
    return UserModel(
        id: json['id'].toString(),
        name: json['name'].toString(),
        age: int.parse(json['age'].toString()),
        // birthdate is the only field that should be null so using a conditional ternary operator to determine to parse or not
        birthdate: json['birthdate'] != null
            ? UserModel._fromTimeStamp(json['birthdate'] as Timestamp)
            : null);
  }

  // Returns the user as a map or json object
  Map<String, Object?> toJSON() => {
        'id': id,
        'name': name,
        'age': age,
        'birthdate': birthdate,
      };

  @override
  String toString() =>
      'UserModel(id: $id, name: $name, age: $age, birthdate: $birthdate)';
}
