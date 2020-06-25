import 'package:flutter/material.dart';

class ProdutoPage extends StatefulWidget {
  final String tag;
  final String description;
  final int price;
  final Function funcao;
  const ProdutoPage(
      {Key key, this.tag, this.description, this.price, this.funcao})
      : super(key: key);
  @override
  _ProdutoPageState createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                  width: width * 0.12,
                  height: height * 0.12)
            ],
            title: Text("De Lyrio's",
                style: TextStyle(color: Colors.yellow, fontSize: 31)),
            backgroundColor: Colors.redAccent),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Hero(
                child: Image.network(
                  'https://de-lyrios-backend.herokuapp.com/images/$tag.png',
                  width: width,
                  height: height * 0.5,
                ),
                tag: tag
              ),
              Text("$description",
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 24)
              ),
              Text("R\$ $price reais",
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 22)
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: widget.funcao,
          child: SizedBox(
            child: Icon(Icons.add_shopping_cart),
            width: 55,
            height: 55,
          ),
          backgroundColor: Colors.redAccent,
        ),
      ),
    );
  }
}
