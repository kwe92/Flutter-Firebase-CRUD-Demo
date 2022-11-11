import 'package:firebasedemo/src/constants/source_of_truth.dart';
import 'package:flutter/material.dart';

Widget customTextField({
  required controller,
  required decoration,
  TextInputType keyboardType = TextInputType.text,
}) {
  return customSizedBox(
    child: TextField(
      controller: controller,
      decoration: decoration,
      keyboardType: keyboardType,
    ),
  );
}
