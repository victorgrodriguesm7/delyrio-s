import 'package:aplicativo/src/Pages/Cadastro/cadastroPage.dart';
import 'package:aplicativo/src/Pages/Home/homePage.dart';
import 'package:aplicativo/src/Pages/Login/loginController.dart';
import 'package:aplicativo/src/Pages/Login/loginRepository.dart';
import 'package:aplicativo/src/core/user.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  LoginController controller;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    controller = LoginController(LoginRepository());
  }

  @override
  void dispose() {
    super.dispose();
  }

  _loginSuccess(User user) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomePage(user)),
    );
  }
  _loginError() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Erro de Login'),
      backgroundColor: Colors.blue,
    ));
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
      child: Center(
          child: Stack(
        children: [
          Positioned(
              left: -width * 0.32,
              top: -height * 0.7,
              child: Transform.rotate(
                angle: 3.14159265359 / 8,
                child: Container(
                    height: height * 2, width: height * 0.5, color: Colors.red),
              )),
          Positioned(
              top: height * 0.02,
              left: width * 0.06,
              child: Image.asset(
                'assets/images/logo-borda.png',
                width: 47,
                height: 47,
              )),
          Positioned(
              top: height * 0.02,
              left: width * 0.06,
              child: Image.asset(
                'assets/images/logo.png',
                width: 46,
                height: 46,
              )),
          Positioned(
              top: height * 0.08,
              left: width * 0.13,
              child: Text("De Lyro's  ",
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
                  )
                )
              ),
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
                            validator: (value){
                              if (value.isEmpty) {
                                return 'Campo não pode ser vazio';
                              } else if (!value.contains('@')) {
                                return 'Email não é válido';
                              }
                              return null;
                            },
                            onChanged: controller.userEmail,
                            decoration: InputDecoration(
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
                              hintText: 'Email',
                            ),
                          ),
                          TextField(
                            obscureText: true,
                            onChanged: controller.userPassword,
                            decoration: InputDecoration(
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
                              hintText: 'Senha',
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              RaisedButton(
                                  onPressed: isLoading
                                    ? null
                                    : () async {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        dynamic user = await controller.login();
                                        if (user != null) {
                                          _loginSuccess(user);
                                        } else {
                                          _loginError();
                                        }

                                        setState(() {
                                          isLoading = false;
                                        });
                                      },
                                  child: Text("Login")
                              ),
                              RaisedButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (_) => CadastroPage()),
                                    );
                                  },
                                  child: Text("Cadastrar"),
                              )
                            ],
                          )
                        ]
                    ),
                      )
                  )
                )
              )
            ],
          )
        ),
      )
    );
  }
}