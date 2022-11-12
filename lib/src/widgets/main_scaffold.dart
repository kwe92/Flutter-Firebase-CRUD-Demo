import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold(
      {super.key,
      required this.title,
      required this.body,
      this.floatingActionButton});
  final Widget body;
  final String title;
  final FloatingActionButton? floatingActionButton;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: body,
          floatingActionButton:
              floatingActionButton != null ? floatingActionButton : null,
        ),
      );
}
