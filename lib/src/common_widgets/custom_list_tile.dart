import 'package:firebasedemo/src/constants/source_of_truth.dart';
import 'package:firebasedemo/src/features/create_user/domain/user.dart';
import 'package:firebasedemo/src/utils/parse_date_time.dart';
import 'package:flutter/material.dart';

Widget customListTile(UserModel user, {void Function()? onTap}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey),
        // color: Colors.deepPurple[200],
      ),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          child: Text(
            user.age.toString(),
          ),
        ),
        title: Text(
          user.name,
          style: nameListTileTextStyle,
        ),
        subtitle: Text(
          // According to Law of Demeter should we move the parser??
          parseDateTime(user.birthdate),
        ),
      ),
    ),
  );
}
