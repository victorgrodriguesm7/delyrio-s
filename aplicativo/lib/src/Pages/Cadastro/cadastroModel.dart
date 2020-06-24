class CadastroModel {
  String name = "";
  String email = "";
  String phonenumber = "";
  String password = "";

  Map<String, dynamic> toJson() => {
        'name': name,
        'password': password,
        'phonenumber': phonenumber,
        'email': email,
      };
}