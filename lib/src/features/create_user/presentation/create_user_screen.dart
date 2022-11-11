import 'package:date_field/date_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasedemo/src/constants/source_of_truth.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key, required this.title});
  final String title;

  @override
  State<UserScreen> createState() => _UserScreenState();
}

InputDecoration decoration({required String label}) => InputDecoration(
      label: Text(label),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );

class _UserScreenState extends State<UserScreen> {
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child:
              ListView(padding: const EdgeInsets.all(24.0), children: <Widget>[
            SizedBox(
              height: 60,
              child: TextField(
                decoration: decoration(
                  label: 'Name',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            gaph24,
            SizedBox(
              height: 60,
              child: TextField(
                decoration: decoration(
                  label: 'Age',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            gaph24,
            SizedBox(
              height: 60,
              child: DateTimeField(
                mode: DateTimeFieldPickerMode.date,
                selectedDate: selectedDate,
                onDateSelected: (DateTime value) {
                  setState(() {
                    selectedDate = value;
                  });
                },
                decoration: decoration(
                  label: 'Birthday',
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
