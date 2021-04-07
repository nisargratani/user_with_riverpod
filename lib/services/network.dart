import 'package:dio/dio.dart';

class Network {
  Dio dio = Dio();
  Future getUsers() async {
    try {
      Response response = await dio.get('https://api.github.com/users');
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
