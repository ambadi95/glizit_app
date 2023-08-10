class AuthRepository {
  Future<bool> login(String userName, String password) async {
    String isValidName = 'glitzadmin@gmail.com';
    String isPassword = 'Gs0r0e7!';

    bool isValidLogin() {
      bool isValidUserID = false;
      bool isValidPassword = false;
      bool isValidLogin = false;
      if (isValidName == userName) {
        isValidUserID = true;
      }
      if (isPassword == password) {
        isValidPassword = true;
      }
      isValidLogin = isValidUserID && isValidPassword;
      return isValidLogin;
    }

    await Future.delayed(const Duration(seconds: 1));
    return isValidLogin();
  }
}
