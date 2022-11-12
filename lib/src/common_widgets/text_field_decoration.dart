import 'package:flutter/material.dart';

// Function for text field decorations
InputDecoration decoration({required String label}) => InputDecoration(
      label: Text(label),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
