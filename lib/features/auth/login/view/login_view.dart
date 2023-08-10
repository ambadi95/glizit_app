import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glizit_app/features/auth/auth_repository/auth_repository.dart';
import 'package:glizit_app/features/auth/auth_form_status/form_submission_status.dart';
import 'package:glizit_app/features/auth/login/bloc/login_bloc.dart';
import 'package:glizit_app/features/auth/login/bloc/login_event.dart';
import 'package:glizit_app/features/auth/login/bloc/login_state.dart';
import 'package:glizit_app/features/screens/dashboard/view/dashboard.dart';
import '../../../../widgets/common_button.dart';
import '../../../../widgets/common_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.teal,
          width: double.infinity,
          child: BlocProvider(
            create: (context) => LoginBloc(AuthRepository()),
            child: _loginForm(),
          )),
    );
  }

  Widget _loginForm() {
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          final formStatus = state.formStatus;
          if (formStatus is SubmissionFailed) {
            _showSnackBar(context, 'Incorrect UserID or Password');
          } else if (formStatus is SubmissionSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Dashboard())
            );
          }
        },
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _userIDField(),
              _sizedBox(20),
              _passwordField(),
              _sizedBox(40),
              _loginButton(),
            ],
          ),
        ));
  }

  Widget _sizedBox(double? height) {
    return SizedBox(
      height: height,
    );
  }

  Widget _userIDField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return CommonTextField(
        label: "User ID",
        validator: (value) => state.isValidUserId ? null : 'Invalid Email',
        onChanged: (value) =>
            context.read<LoginBloc>().add(LoginUserIDChange(userID: value)),
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return CommonTextField(
        label: "Password",
        obscureText: true,
        validator: (value) => state.isValidPassword ? null : 'Invalid password',
        onChanged: (value) =>
            context.read<LoginBloc>().add(LoginPasswordChange(password: value)),
      );
    });
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? const CircularProgressIndicator()
          : CommonButton(
              label: "Login",
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  print("h3llo");
                  context.read<LoginBloc>().add(LoginSubmitted());
                }
              },
            );
    });
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
