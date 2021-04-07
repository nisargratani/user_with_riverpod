import 'package:demo_users/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Tab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        if (watch(userDataProvider).allUsers.isEmpty) {
          context.read(userDataProvider.notifier).fetchallUsers();
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: watch(userDataProvider).allUsers.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      watch(userDataProvider).allUsers[index].avatarUrl),
                ),
                title: Text(watch(userDataProvider).allUsers[index].name),
                trailing: Checkbox(
                  value: watch(userDataProvider).allUsers[index].isChecked,
                  onChanged: (newValue) {
                    print(watch(userDataProvider).allUsers.length);
                    if (newValue == true) {
                      context
                          .read(userDataProvider)
                          .addUsers(watch(userDataProvider).allUsers[index]);
                    } else {
                      context
                          .read(userDataProvider)
                          .removeUsers(watch(userDataProvider).allUsers[index]);
                    }
                    context.read(userDataProvider).changeValue(
                        watch(userDataProvider).allUsers[index], newValue);
                  },
                ),
              );
            },
          );
        }
      },
    );
  }
}
