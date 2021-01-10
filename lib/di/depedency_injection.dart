import 'package:fetchdataapi/data/user.dart';
import 'package:fetchdataapi/data/user_data_mock.dart';
import 'package:fetchdataapi/data/user_data_prod.dart';

enum Flavor { MOCK, PROD }

class Injector {
  static final Injector _singleton = Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();
  UserRepository get userRepository {
    switch (_flavor) {
      case Flavor.MOCK:
        return MockUserRepository();
      case Flavor.PROD:
        return ProdUserRepository();
      default:
        return ProdUserRepository();
    }
  }
}
