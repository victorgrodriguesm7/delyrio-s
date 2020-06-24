import 'dart:convert';
import 'package:http/http.dart' as http;
import 'cadastroModel.dart';

class CadastroRepository {
  Future <bool> doCadastro(CadastroModel model) async{
    var client = http.Client();
    try{
        Map<String, String> headers = {"Content-type": "application/json"};
        final response = await client.post(
          'https://de-lyrios-backend.herokuapp.com/users',
          body: json.encode(model.toJson()),
          headers: headers
        );
        if (response.statusCode == 200) {
          return true;
          
        }
        else {
          return false;
        }
    }catch(e){
      return false;
    }
  }
}