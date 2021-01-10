import 'package:fetchdataapi/data/user.dart';
import 'package:fetchdataapi/di/depedency_injection.dart';

abstract class UserListViewContract {
  void onLoadUserComplete(List<User> items);
  void onLoadUserError();
}

class UserListPresenter {
  UserListViewContract _view;
  UserRepository _userRepository;

  UserListPresenter(this._view) {
    _userRepository = Injector().userRepository;
  }

  void loadUsers() {
    _userRepository
        .fetchUsers()
        .then((value) => _view.onLoadUserComplete(value))
        .catchError((error) => _view.onLoadUserError());
  }
}
