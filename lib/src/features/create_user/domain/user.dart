import 'package:firebase_auth/firebase_auth.dart';

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

  // Constructor to create a UserModel Object from a json object passed
  factory UserModel.fromJSON(Map<String, Object?> json) => UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      age: int.parse(json['age'] as String),
      birthdate: json['birthdate'].toString().isNotEmpty
          ? DateTime.parse(json['birthdate'].toString())
          : null);

  // Returns the user as a map or json object
  Map<String, Object?> toJSON() => {
        'id': id,
        'name': name,
        'age': age,
        'birthdate': birthdate,
      };

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, age: $age, birthdate: $birthdate)';
  }
}
