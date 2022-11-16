import 'package:flutter/material.dart';

const gaph24 = SizedBox(
  height: 24.0,
);

const gaph12 = SizedBox(
  height: 12.0,
);

class CustomTextStyles {
  const CustomTextStyles();
  static const TextStyle nameListTileTextStyle = TextStyle(fontSize: 18.0);
}

// Function for text field decorations
class FieldDecoration {
  static InputDecoration decoration({required String label}) => InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      );
}

class CustomEdgeInsets {
  static const EdgeInsets all24 = EdgeInsets.all(24.0);
  static const EdgeInsets top12 = EdgeInsets.only(top: 12.0);
}
