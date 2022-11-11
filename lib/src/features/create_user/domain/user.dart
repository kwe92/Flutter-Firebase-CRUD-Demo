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
