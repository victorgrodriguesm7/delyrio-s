import 'dart:convert';
import 'package:aplicativo/src/components/Carrinho/carrinhoModel.dart';
import 'package:http/http.dart' as http;

class CarrinhoRepository {
  Future<bool> doPedido(CarrinhoModel model,String uid) async {
    var client = http.Client();
    
    try{
      Map<String, String> headers = {"Content-type": "application/json","Authorization":uid};
      final response = await client.post(
        'https://de-lyrios-backend.herokuapp.com/pedido',
        body: json.encode(model.toJson()),
        headers: headers
      );
      
      if (response.statusCode == 200) {
           return true;
   
      }else{
        return false;
      }
    } catch(e){
      return false;
    }
  }
}