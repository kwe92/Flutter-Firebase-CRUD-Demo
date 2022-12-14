import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:firebasedemo/src/common_widgets/custom_sized_boxes.dart';
import 'package:firebasedemo/src/constants/source_of_truth.dart';
import 'package:firebasedemo/src/features/create_user/domain/user.dart';
import 'package:firebasedemo/src/common_widgets/custom_text_field.dart';
import 'package:firebasedemo/src/common_widgets/main_scaffold.dart';
import 'package:flutter/material.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

//TODO: Move  _createUser logic to a repository and a data folder | user Riverpod architecture
Future<void> _createUser(
    {required name, required age, required birthdate}) async {
  final docUsers = FirebaseFirestore.instance.collection('users').doc();
  final newUser =
      UserModel(id: docUsers.id, name: name, age: age, birthdate: birthdate);
  final json = newUser.toJSON();
  await docUsers.set(json);
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Firestore Demo: Create User',
      body: Center(
        child: ListView(
          //TODO: move EdgeInsets to source of truth file
          padding: CustomEdgeInsets.all24,
          children: <Widget>[
            customTextField(
              controller: nameController,
              decoration: FieldDecoration.decoration(label: 'Name'),
            ),
            gaph24,
            customTextField(
                controller: ageController,
                decoration: FieldDecoration.decoration(label: 'Age'),
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
                decoration: FieldDecoration.decoration(label: 'Birthday'),
              ),
            ),
            gaph12,
            customSizedBoxButtonBox(
              child: ElevatedButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty &&
                      ageController.text.isNotEmpty) {
                    _createUser(
                        name: nameController.text,
                        age: int.parse(ageController.text),
                        birthdate: selectedDate);
                  }
                  Navigator.pop(context);
                },
                child: const Text('Create User'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
