import 'package:firebasedemo/src/features/create_user/presentation/create_user_screen.dart';
import 'package:firebasedemo/src/features/view_users/current_users.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const _title = 'Firebase Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => const CurrentUserScreen(),
        '/createuser': (context) => const UserScreen(title: _title)
      },
      // home: CurrentUserScreen(),
      // UserScreen(title: _title),
    );
  }
}
