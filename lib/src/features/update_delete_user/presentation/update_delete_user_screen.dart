import 'package:firebasedemo/src/common_widgets/custom_sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:firebasedemo/src/constants/source_of_truth.dart';
import 'package:firebasedemo/src/features/create_user/domain/user.dart';
import 'package:firebasedemo/src/common_widgets/custom_text_field.dart';
import 'package:firebasedemo/src/common_widgets/main_scaffold.dart';

// ignore: todo
//TODO: Pass data to this screen

// class UpdateDeleteScreen

class UpdateDeleteScreen extends StatefulWidget {
  const UpdateDeleteScreen({super.key});

  @override
  State<UpdateDeleteScreen> createState() => _UpdateDeleteScreenState();
}

Future<void> _updateUser(
    {required String id,
    required String name,
    required int age,
    required DateTime? birthdate}) async {
  final docUsers = FirebaseFirestore.instance.collection('users').doc(id);
  final newUser = UserModel(id: id, name: name, age: age, birthdate: birthdate);
  final json = newUser.toJSON();
  await docUsers.update(json);
}

Future<void> _deleteUser({required String id}) async {
  final docUsers = FirebaseFirestore.instance.collection('users').doc(id);
  await docUsers.delete();
}

class _UpdateDeleteScreenState extends State<UpdateDeleteScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    DateTime? selectedDate = user.birthdate;
    return CustomScaffold(
      title: 'Firestore Demo: Update & Delete User',
      body: Center(
        child: ListView(
          padding: CustomEdgeInsets.all24,
          children: <Widget>[
            customTextField(
              controller: nameController,
              decoration: FieldDecoration.decoration(label: user.name),
            ),
            gaph24,
            customTextField(
                controller: ageController,
                decoration:
                    FieldDecoration.decoration(label: user.age.toString()),
                keyboardType: TextInputType.number),
            gaph24,
            customSizedBox(
              child: DateTimeField(
                mode: DateTimeFieldPickerMode.date,
                selectedDate: selectedDate,
                onDateSelected: (DateTime value) {
                  // sets selectedDate to the values the user selected from the drop down
                  setState(() {
                    selectedDate = value;
                  });
                },
                decoration: FieldDecoration.decoration(
                  label: 'Birthday',
                ),
              ),
            ),
            gaph12,
            customSizedBoxButtonBox(
              child: ElevatedButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty &&
                      ageController.text.isNotEmpty) {
                    _updateUser(
                        id: user.id,
                        name: nameController.text,
                        age: int.parse(ageController.text),
                        birthdate: selectedDate);
                  }
                  Navigator.pop(context);
                },
                child: const Text('Update User'),
              ),
            ),
            gaph12,
            customSizedBoxButtonBox(
              child: ElevatedButton(
                onPressed: () {
                  _deleteUser(id: user.id);
                  Navigator.pop(context);
                },
                child: const Text('Delete User'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
