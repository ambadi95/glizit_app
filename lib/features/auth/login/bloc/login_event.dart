abstract class LoginEvent {}

class LoginUserIDChange extends LoginEvent {
  String? userID;
  LoginUserIDChange({this.userID});
}

class LoginPasswordChange extends LoginEvent {
  final String? password;
  LoginPasswordChange({this.password});
}

class LoginSubmitted extends LoginEvent {
}
