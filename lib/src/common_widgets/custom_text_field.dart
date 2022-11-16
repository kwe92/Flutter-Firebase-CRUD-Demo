import 'package:firebasedemo/src/common_widgets/custom_sized_boxes.dart';
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
