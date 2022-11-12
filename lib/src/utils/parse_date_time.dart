import 'package:flutter/material.dart';

String parseDateTime(DateTime? dateTime) {
  if (dateTime == null) {
    return '';
  } else {
    return '${dateTime.year.toString()}-${dateTime.month.toString()}-${dateTime.day.toString()}';
  }
}
