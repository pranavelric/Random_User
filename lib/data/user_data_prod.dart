import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fetchdataapi/data/user.dart';

class ProdUserRepository implements UserRepository {
  var url = "https://randomuser.me/api/?results=10";

  @override
  Future<List<User>> fetchUsers() async {
    var response = await http.get(url);
    final List items = jsonDecode(response.body)['results'];

    // return Future.value(items);

    if (response.statusCode == 200) {
      //  return Future.value(items);
      return items.map((e) => User.fromMap(e)).toList();
    } else {
      throw FetchDataException(
          "An error occured : [Status code: ${response.statusCode}]");
    }
  }
}
