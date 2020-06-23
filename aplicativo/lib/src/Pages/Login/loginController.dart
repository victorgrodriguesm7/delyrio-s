import 'package:aplicativo/src/core/user.dart';
import 'package:flutter/material.dart';
import 'userModel.dart';
import 'loginRepository.dart';

class LoginController {
  final formKey = GlobalKey<FormState>();
  final LoginRepository repository;
  LoginController(this.repository);
  UserModel user = UserModel();

  userEmail(String value) => user.email = value;
  userPassword(String value) => user.password = value;
  Future<User> login() async {
    if (!formKey.currentState.validate()) {
      return null;
    }
    formKey.currentState.save();

    try {
      return await repository.doLogin(user);
    } catch (e) {
      return null;
    }
  }
}