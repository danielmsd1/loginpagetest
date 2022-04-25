import 'dart:async';

import 'package:loginpagetest/bloc/login_validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends Object with LoginValidators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  //add data to the stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  //For the button
  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (a, b) => true);

  //change the values
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  //
  submit() {
    final String validEmail = _email.value;
    final String password = _password.value;

    print('The details are: $validEmail and password: $password');
  }

  dispose() {
    _email.close();
    _password.close();
  }
}
