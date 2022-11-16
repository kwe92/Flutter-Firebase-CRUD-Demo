import 'package:flutter/material.dart';

// Returns a DateTime object in String format
class Parser {
  const Parser();

  static String parseDateTime(DateTime? dateTime) => dateTime == null
      ? ''
      : '${dateTime.year.toString()}-${dateTime.month.toString()}-${dateTime.day.toString()}';
}
