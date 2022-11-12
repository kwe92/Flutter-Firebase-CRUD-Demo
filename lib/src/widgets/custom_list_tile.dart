import 'package:firebasedemo/src/features/create_user/domain/user.dart';
import 'package:firebasedemo/src/utils/parse_date_time.dart';
import 'package:flutter/material.dart';

Widget customListTile(UserModel user) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey),
        // color: Colors.deepPurple[200],
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            user.age.toString(),
          ),
        ),
        title: Text(user.name),
        subtitle: Text(parseDateTime(user.birthdate)),
      ),
    ),
  );
}
