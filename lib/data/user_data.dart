import 'package:demo_users/data/user.dart';
import 'package:demo_users/services/network.dart';
import 'package:flutter/cupertino.dart';

class UserData extends ChangeNotifier {
  List<User> allUsers = List<User>();
  List<User> bookmarkedUsers = List<User>();

  Future fetchallUsers() async {
    Network network = Network();
    dynamic data = await network.getUsers();
    for (var i in data) {
      User user = User();
      user.name = i['login'];
      user.avatarUrl = i['avatar_url'];
      allUsers.add(user);
    }
    notifyListeners();
  }

  void addUsers(User user) {
    bookmarkedUsers.add(user);
    notifyListeners();
  }

  void removeUsers(User user) {
    bookmarkedUsers.remove(user);
    notifyListeners();
  }

  void changeValue(User user, bool newValue) {
    user.isChecked = newValue;
    notifyListeners();
  }
}
