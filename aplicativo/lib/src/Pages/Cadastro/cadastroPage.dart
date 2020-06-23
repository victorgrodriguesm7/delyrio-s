import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
            child: Stack(
      children: [
        Positioned(
            left: -width * 0.3,
            top: -height * 0.6,
            child: Transform.rotate(
              angle: 3.14159265359 / 8,
              child: Container(
                  height: height * 2, width: height * 0.5, color: Colors.red),
            )
          ),
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
            )
          ),
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
                )
              )
            ),
        Positioned(
            child: Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                      TextField(
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white38,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.redAccent, width: 3.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 3.0),
                          ),
                          hintText: 'Seu nome',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                      ),
                      TextField(
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white38,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.redAccent, width: 3.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 3.0),
                          ),
                          hintText: 'Sua email',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                      ),
                      TextField(
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white38,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.redAccent, width: 3.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 3.0),
                          ),
                          hintText: 'Seu Telefone',
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                      ),
                      TextField(
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white38,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.redAccent, width: 3.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 3.0),
                          ),
                          hintText: 'Sua senha',
                        ),
                      ),
                    ]
                  )
                )
              )
            ),
        Positioned(
            width: 200,
            height: 30,
            left: 80,
            top: 600,
            child: RaisedButton(
                color: Colors.yellow,
                child: Text(
                  "Cadastrar",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {}
            )
          )
        ],
        )
      )
    );
  }
}
