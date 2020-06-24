
import 'package:aplicativo/src/Pages/Cadastro/cadastroModel.dart';
import 'package:aplicativo/src/Pages/Cadastro/cadastroRepository.dart';
import 'package:flutter/material.dart';

class CadastroController {
  
  final formKey = GlobalKey<FormState>();
  CadastroModel cadastro = CadastroModel();
  final CadastroRepository repository;
  CadastroController (this.repository);

  cadastroName(String value) => cadastro.name = value;
  cadastroEmail(String value) => cadastro.email = value;
  cadastroPhonenumber(String value) => cadastro.phonenumber= value;
  cadastroPassword(String value) => cadastro.password = value;
  Future <bool> cadastrar () async {
    if (!formKey.currentState.validate()) {
      return false;
  }
 formKey.currentState.save();
    try{
      return await repository.doCadastro(cadastro);
    }
    catch  (e) {
      return false;
    } 
  }
}
