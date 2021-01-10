import 'dart:async';

class User {
  String title;
  String first;
  String last;
  String email;
  String image;

  User(this.title, this.first, this.last, this.email, this.image);

  User.fromMap(Map<String, dynamic> map)
      : title = map['name']['title'],
        first = map['name']['first'],
        last = map['name']['last'],
        email = map['email'],
        image = map['picture']['large'];
}

abstract class UserRepository {
  Future<List<User>> fetchUsers();
}

class FetchDataException implements Exception {
  final _message;
  FetchDataException([this._message]);
  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}
