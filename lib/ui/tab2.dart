import 'package:demo_users/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        return ListView.builder(
          itemCount: watch(userDataProvider).bookmarkedUsers.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    watch(userDataProvider).bookmarkedUsers[index].avatarUrl),
              ),
              title: Text(watch(userDataProvider).bookmarkedUsers[index].name),
              trailing: Checkbox(
                value: true,
                onChanged: (newValue) {
                  print(watch(userDataProvider).allUsers.length);
                  for (int i = 0;
                      i < watch(userDataProvider).allUsers.length;
                      i++) {
                    if (watch(userDataProvider).bookmarkedUsers[index] ==
                        watch(userDataProvider).allUsers[i]) {
                      context.read(userDataProvider).changeValue(
                          watch(userDataProvider).allUsers[i], false);
                    }
                  }
                  context.read(userDataProvider).removeUsers(
                      watch(userDataProvider).bookmarkedUsers[index]);
                },
              ),
            );
          },
        );
      },
    );
  }
}
