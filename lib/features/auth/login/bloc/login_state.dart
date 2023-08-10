import '../../auth_form_status/form_submission_status.dart';

class LoginState {
  final String? username;
  final String? password;
  final FormSubmissionStatus formStatus;

  bool get isValidUserId => RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(username!);
  bool get isValidPassword => password!.length > 6;

  LoginState(
      {this.username = '',
      this.password = '',
      this.formStatus = const InitialFormStatus()});

  LoginState copyWith(
      {String? username, String? password, FormSubmissionStatus? formStatus}) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
