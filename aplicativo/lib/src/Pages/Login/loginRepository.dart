import 'package:aplicativo/src/core/user.dart';
import 'userModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginRepository {
  Future<User> doLogin(UserModel model) async {
    var client = http.Client();
    try{
      Map<String, String> headers = {"Content-type": "application/json"};
      final response = await client.post(
        'https://de-lyrios-backend.herokuapp.com/session',
        body: json.encode(model.toJson()),
        headers: headers
      );
      
      if (response.statusCode == 200) {
        User user = new User.fromJson(
          json.decode(response.body),
          model.email
        );
        return user;
      }else{
        return null;
      }
    } catch(e){
      return null;
    }
  }
}