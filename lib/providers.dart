import 'package:demo_users/data/user_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userDataProvider = ChangeNotifierProvider((ref) => UserData());
