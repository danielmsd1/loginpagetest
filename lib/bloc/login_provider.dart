import 'package:flutter/cupertino.dart';
import 'package:loginpagetest/bloc/login_bloc.dart';

class LoginProvider extends InheritedWidget {
  final bloc = LoginBloc();

  LoginProvider({Key? key, required super.child}) : super(key: key);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static LoginBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<LoginProvider>())!.bloc;
  }
}
