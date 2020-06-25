import 'package:aplicativo/src/Pages/Cadastro/cadastroController.dart';
import 'package:aplicativo/src/Pages/Cadastro/cadastroRepository.dart';
import 'package:aplicativo/src/Pages/Login/loginPage.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
 final _scaffoldKey = GlobalKey<ScaffoldState>();
  CadastroController controller = CadastroController(CadastroRepository());
  bool isObscure = true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        key: _scaffoldKey,
        body: Center(
            child: Stack(
          children: [
            Positioned(
                left: -width * 0.3,
                top: -height * 0.6,
                child: Transform.rotate(
                  angle: 3.14159265359 / 7,
                  child: Container(
                      height: height * 2,
                      width: height * 0.45,
                      color: Colors.red),
                )),
            Positioned(
              top: 100,
              left: 155,
              child: Image.asset(
                'assets/images/logo.png',
                width: 47,
                height: 47,
              ),
            ),
            Positioned(
                top: 100,
                left: 155,
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 46,
                  height: 46,
                )),
            Positioned(
                top: 46,
                left: 70,
                child: Text("Cadastrar  ",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.orangeAccent.withOpacity(0.9),
                      shadows: [
                        Shadow(
                          blurRadius: 4.5,
                          color: Colors.grey,
                          offset: Offset(3.5, 3.5),
                        ),
                      ],
                    ))),
            Positioned(
                child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(
                        
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[

                               TextFormField(
                              validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Campo não pode ser vazio';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  errorStyle: TextStyle(color:Colors.black87,
                                  fontSize: 15),
                                  filled: true,
                                  fillColor: Colors.white38,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.redAccent, width: 3.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.grey, width: 3.0),
                                  ),
                                  hintText: 'Seu nome',
                                ),
                                onChanged: controller.cadastroName,
                              ),
                            
                            Padding(
                              padding: EdgeInsets.only(top: 16),
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Campo não pode ser vazio';
                                } else if (!value.contains('@')) {
                                  return 'Email não é válido';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                 errorStyle: TextStyle(color:Colors.black87,
                                  fontSize: 15),
                                filled: true,
                                fillColor: Colors.white38,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.redAccent, width: 3.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 3.0),
                                ),
                                hintText: 'Sua email',
                              ),
                              onChanged: controller.cadastroEmail,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16),
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Campo não pode ser vazio';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                 errorStyle: TextStyle(color:Colors.black87,
                                  fontSize: 15),
                                filled: true,
                                fillColor: Colors.white38,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.redAccent, width: 3.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 3.0),
                                ),
                                hintText: 'Seu Telefone',
                              ),
                              onChanged: controller.cadastroPhonenumber,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16),
                            ),
                            Stack(children: <Widget>[
                              Positioned(
                                  child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Campo não pode ser vazio';
                                  }
                                  return null;
                                },
                                obscureText: isObscure,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                   errorStyle: TextStyle(color:Colors.black87,
                                  fontSize: 15),
                                  filled: true,
                                  fillColor: Colors.white38,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.redAccent, width: 3.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 3.0),
                                  ),
                                  hintText: 'Sua senha',
                                ),
                                onChanged: controller.cadastroPassword,
                              )),
                              Positioned(
                                right: -width * 0.01,
                                bottom: width * 0.01,
                                child: FlatButton(
                                  child: isObscure
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      isObscure = !isObscure;
                                    });
                                  },
                                ),
                              )
                            ]),
                          ]),
                        )))),
            Positioned(
                width: 250,
                height: 50,
                left: 58,
                top: 560,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.black)
                )  ,
                    color: Colors.yellow,
                    child: Text(
                      "Cadastrar",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    onPressed: () async {
                      var sucesso = await controller.cadastrar();
                      print(sucesso);
                      if (sucesso == true) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Cadastro efetuado com sucesso"),
                              content: Text("Vamos fazer o login ? Let's go"),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text("Logar"),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => LoginPage()
                                      ), //LoginPage
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text('Erro no cadastro'),
                          backgroundColor: Colors.black45,
                        ));
                      }
                    })
                    ),
                    Positioned(
                      top: 610,
                      left: 100,
                      child:FlatButton(onPressed: (){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => Container()),//LoginPage
                        );
                      
                    }, child: Text("Já tenho um cadastro",style: TextStyle(decoration: TextDecoration.underline),)) )
          ],
        )));     
  }
}