import 'package:firebasedemo/src/constants/source_of_truth.dart';
import 'package:firebasedemo/src/features/create_user/domain/user.dart';
import 'package:firebasedemo/src/common_widgets/custom_list_tile.dart';
import 'package:firebasedemo/src/common_widgets/main_scaffold.dart';
import 'package:firebasedemo/src/features/update_delete_user/presentation/update_delete_user_screen.dart';
import 'package:firebasedemo/src/utils/stream_firestore.dart';
import 'package:flutter/material.dart';

class CurrentUserScreen extends StatefulWidget {
  const CurrentUserScreen({super.key});

  @override
  State<CurrentUserScreen> createState() => _CurrentUserScreenState();
}

//TODO: Add a data folder and move watchUsers() into a repository as a method | Riverpod

/// Used in a callback to push [UpdateDeleteScreen]
_pushUpdateDeletePage(
        {required BuildContext context, required UserModel user}) =>
    Navigator.pushNamed(context, '/update_delete_screen', arguments: user);

class _CurrentUserScreenState extends State<CurrentUserScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Firestore Demo: Current Users',
      // With Streaming data if the data is changed on the Firebase side
      // those changes are realtime and will be reflected immediately in the app
      // Use FutureBuilder and return the first snaphot of the stream Stream.first
      body: StreamBuilder(
        stream: StreamFireStore.getListDocsData(collectionPath: 'users'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          //snapshot error
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          //TODO: Handle if the snapshot data is empty
          // snapshot has data
          final List<UserModel> users = [
            for (var user in snapshot.data!) UserModel.fromJSON(user)
          ];
          //snapshot.data?.map((user) => UserModel.fromJSON(user)).toList();
          // Used for debuging and printing the data recieved from Firebase

          // debugPrint(users.toString());

          // Build Users ListTile
          return Padding(
            //TODO: move EdgeInsets to source of truth file
            padding: CustomEdgeInsets.top12,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) => customListTile(
                      user: users[index],
                      onTap: () {
                        _pushUpdateDeletePage(
                            context: context, user: users[index]);
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigates to UserScreen
          Navigator.pushNamed(context, '/createuser');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
