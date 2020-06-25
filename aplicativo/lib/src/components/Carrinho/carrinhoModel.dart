class CarrinhoModel {
  List items = [];
  List amount = [];
  String address = "";

  Map <String, dynamic> toJson() => 
    {
      "items":items,
      "amount":amount,
      "address":address
    };
  
}