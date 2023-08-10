import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glizit_app/features/auth/form_submission_status.dart';
import 'package:glizit_app/features/auth/login/bloc/login_event.dart';
import 'package:glizit_app/features/auth/login/bloc/login_state.dart';

import '../../auth_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  LoginBloc(this.authRepository) : super(LoginState()) {
    on<LoginUserIDChange>(_userNameChange);
    on<LoginPasswordChange>(_passwordChange);
    on<LoginSubmitted>(_loginSubmit);
  }

  void _userNameChange(event, emit) {
    emit(state.copyWith(username: event.userID));
  }

  void _passwordChange(event, emit) {
    emit(state.copyWith(password: event.password));
  }

  void _loginSubmit(event, emit) async {
    emit(state.copyWith(formStatus: FormSubmitting()));
    try {
     var response = await authRepository.login(state.username!, state.password!);
     if(response == true){
       emit(state.copyWith(formStatus: SubmissionSuccess()));
       emit(state.copyWith(password: ""));
       emit(state.copyWith(username: ""));

     }else{
       emit(state.copyWith(formStatus: SubmissionFailed()));
       emit(state.copyWith(password: ""));
       emit(state.copyWith(username: ""));
     }

    } catch (e) {
    debugPrint('Something went Wrong');
    }
  }
}
