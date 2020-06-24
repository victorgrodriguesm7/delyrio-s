import 'package:flutter/material.dart';

class ProdutoPage extends StatefulWidget {
  final String tag;
  final String description;
  final int price;
  const ProdutoPage({Key key, this.tag, this.description, this.price}) : super(key: key);
  @override
  _ProdutoPageState createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {
  @override
  Widget build(BuildContext context) {
    String tag = widget.tag;
    String description = widget.description;
    int price = widget.price;
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            actions: [
              Image.network(
                'https://de-lyrios-backend.herokuapp.com/images/Assets/logo.png',
                width: 140,
                height: 140,
              )
            ],
            title: Text("De Lyirio's",
            style: TextStyle(color: Colors.yellow, fontSize: 31)),
            backgroundColor: Colors.redAccent
          ),
          body: Center(
            child: Container(
              child: Column(
                children: <Widget>[
                  Hero( 
                    child: Image.network(
                      'https://de-lyrios-backend.herokuapp.com/images/$tag.png',
                    ),
                    tag: tag
                  ),
                  Text("$description"),
                  Text("R\$ $price reais")
                ],
              ),
            ), 
          ),
      ),
    );
  }
}