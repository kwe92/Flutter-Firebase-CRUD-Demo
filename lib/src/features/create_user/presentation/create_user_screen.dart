import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasedemo/src/constants/source_of_truth.dart';
import 'package:firebasedemo/src/features/create_user/domain/user.dart';
import 'package:firebasedemo/src/features/create_user/presentation/custom_text_field.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key, required this.title});
  final String title;

  @override
  State<UserScreen> createState() => _UserScreenState();
}

// Function for text field decorations
InputDecoration _decoration({required String label}) => InputDecoration(
      label: Text(label),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );

Future<void> _createUser(
    {required name, required age, required birthdate}) async {
  final docUsers = FirebaseFirestore.instance.collection('users').doc();
  final newUser =
      UserModel(id: docUsers.id, name: name, age: age, birthdate: birthdate);
  final json = newUser.toJSON();
  await docUsers.set(json);
}

class _UserScreenState extends State<UserScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: ListView(
            padding: const EdgeInsets.all(24.0),
            children: <Widget>[
              customTextField(
                controller: nameController,
                decoration: _decoration(label: 'Name'),
              ),
              gaph24,
              customTextField(
                  controller: ageController,
                  decoration: _decoration(label: 'Age'),
                  keyboardType: TextInputType.number),
              gaph24,
              customSizedBox(
                child: DateTimeField(
                  mode: DateTimeFieldPickerMode.date,
                  selectedDate: selectedDate,
                  onDateSelected: (DateTime value) {
                    setState(() {
                      selectedDate = value;
                    });
                  },
                  decoration: _decoration(
                    label: 'Birthday',
                  ),
                ),
              ),
              gaph12,
              SizedBox(
                height: 38.0,
                child: ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isNotEmpty &&
                        ageController.text.isNotEmpty) {
                      _createUser(
                          name: nameController.text,
                          age: int.parse(ageController.text),
                          birthdate: selectedDate);
                    }
                  },
                  child: const Text('Create User'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
