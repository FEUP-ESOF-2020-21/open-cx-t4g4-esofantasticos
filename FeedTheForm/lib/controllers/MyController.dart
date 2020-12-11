import 'DatabaseController.dart';

class MyController implements DatabaseController {
  String currentUser;

  MyController(
      String currentUser,
      ) {
    this.currentUser = currentUser;
  }

  @override
  bool isAdmin() {
    if(currentUser.compareTo("admin") == 0) return true;
    else return false;
  }

  @override
  String getCurrentUser() {
    return currentUser;
  }
}
