import 'package:flutter/material.dart';
import 'package:loginpagetest/bloc/login_bloc.dart';
import 'package:loginpagetest/bloc/login_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyInitApp extends StatelessWidget {
  const MyInitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginProvider(
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginBloc = LoginBloc();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sample test page!'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmailTextField(loginBloc: loginBloc),
              const SizedBox(
                height: 20,
              ),
              PasswordTextField(loginBloc: loginBloc),
              const SizedBox(
                height: 20,
              ),
              SubmitBtn(loginBloc: loginBloc),
            ],
          ),
        ),
      ),
    );
  }
}

///---------------------------------------------TextFields
//email textField
class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key? key,
    required this.loginBloc,
  }) : super(key: key);
  final LoginBloc loginBloc;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: loginBloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: loginBloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Email Address',
              border: const OutlineInputBorder(),
              errorText: snapshot.error.toString(),
            ),
          );
        });
  }
}

//password textField
class PasswordTextField extends StatelessWidget {
  const PasswordTextField({Key? key, required this.loginBloc})
      : super(key: key);
  final LoginBloc loginBloc;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: loginBloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: loginBloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Password',
              border: const OutlineInputBorder(),
              errorText: snapshot.error.toString(),
            ),
          );
        });
  }
}

///---------------------------------------------Buttons
class SubmitBtn extends StatelessWidget {
  const SubmitBtn({Key? key, required this.loginBloc}) : super(key: key);
  final LoginBloc loginBloc;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: loginBloc.submitValid,
        builder: (context, snapshot) {
          return ElevatedButton(
            onPressed: snapshot.hasData ? loginBloc.submit : null,
            child: const Text('Submit data'),
          );
        });
  }
}
