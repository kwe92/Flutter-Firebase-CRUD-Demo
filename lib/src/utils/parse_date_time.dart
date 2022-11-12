import 'package:flutter/material.dart';

// Returns a DateTime object in String format
String parseDateTime(DateTime? dateTime) {
  if (dateTime == null) {
    return '';
  } else {
    return '${dateTime.year.toString()}-${dateTime.month.toString()}-${dateTime.day.toString()}';
  }
}
