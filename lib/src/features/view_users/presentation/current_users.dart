import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasedemo/src/features/create_user/domain/user.dart';
import 'package:firebasedemo/src/widgets/custom_list_tile.dart';
import 'package:firebasedemo/src/widgets/main_scaffold.dart';
import 'package:flutter/material.dart';

class CurrentUserScreen extends StatefulWidget {
  const CurrentUserScreen({super.key});

  @override
  State<CurrentUserScreen> createState() => _CurrentUserScreenState();
}

//TODO: Add a data folder and move watchUsers() into a repository as a method | Riverpod
Stream<List<UserModel>> watchUsers() =>
    FirebaseFirestore.instance.collection('users').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => UserModel.fromJSON(doc.data())).toList());

class _CurrentUserScreenState extends State<CurrentUserScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Firebase Demo: Current Users',
      body: StreamBuilder(
        stream: watchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          final List<UserModel>? users = snapshot.data;

          //debugPrint(users.toString()); //// Uused for debuging and checking the data recieved from Firebase

          return Padding(
            //TODO: move EdgeInsets to source of truth file
            padding: const EdgeInsets.only(top: 12.0),
            child: ListView.builder(
              itemCount: users?.length,
              itemBuilder: (context, index) => customListTile(users![index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/createuser');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
