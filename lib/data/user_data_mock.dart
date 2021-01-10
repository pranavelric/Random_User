import 'package:fetchdataapi/data/user.dart';

class MockUserRepository implements UserRepository {
  @override
  Future<List<User>> fetchUsers() {
    //passing dummy data to check functionality
    return Future.value(users);
  }
}

var users = <User>[
  User("Mr", "Pranav", "Elric", "temp@gmail.com",
      "https://static2.srcdn.com/wordpress/wp-content/uploads/2020/08/Naruto-Uzumaki-Hokage-young.jpg?q=50&fit=crop&w=960&h=500"),
  User("Mr", "Hinata", "Shoyo", "middle_blocker@gmail.com",
      "https://i.pinimg.com/originals/bf/f4/c1/bff4c1e363359e8a1c48db2b75adfdf4.jpg"),
  User("Mr", "Kageyama", "Tobio", "setter@gmail.com",
      "https://static.wikia.nocookie.net/haikyuu/images/e/e7/Kageyama_s4-e7-3.png/revision/latest?cb=20200519170107")
];
