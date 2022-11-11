import 'package:firebasedemo/src/features/create_user/presentation/create_user_screen.dart';
import 'package:flutter/material.dart';
//TODO: Add button to user page and decouple code a bit
//TODO: push a user to Firebase
//TODO: Create a base user class

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const _title = 'Firebase Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UserScreen(title: _title),
    );
  }
}
