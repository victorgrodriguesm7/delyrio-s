import 'package:aplicativo/src/Pages/Produto/produtoPage.dart';
import 'package:flutter/material.dart';

class Produto extends StatefulWidget {
  final Map produto;
  final Function funcao;

  const Produto({Key key, this.produto, this.funcao}) : super(key: key);
  @override
  _ProdutoState createState() => _ProdutoState();
}

class _ProdutoState extends State<Produto> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String id = widget.produto['uid'];
    String name = widget.produto['name'];
    String description = widget.produto['description'];
    int price = widget.produto['price'];
    return Center(
        child: Container(
            height: height * 0.25,
            width: width * 0.45,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(4)
            ),
            child: FlatButton(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 80,
                              width: width * 0.5,
                              child: Hero(
                                  child: Image.network(
                                    'https://de-lyrios-backend.herokuapp.com/images/$id.png',
                                    fit: BoxFit.fill,
                                  ),
                                  tag: id)),
                          Text(
                            '$name',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            "R\$ $price reais",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                        ]
                      )
                    ]
                  ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => ProdutoPage(
                        tag: id,
                        description: description,
                        price: price,
                        funcao: widget.funcao
                      )
                    )
                  );
              },
            )
          )
        );
  }
}
