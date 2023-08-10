class AuthRepository {
  Future<bool> login(String userName, String password) async {
    String isValidName = 'ambadi@gmail.com';
    String isPassword = 'password';

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

    await Future.delayed(const Duration(seconds: 3));
    return isValidLogin();
  }
}
