import 'package:aplicativo/src/Pages/Produto/produtoPage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Produto extends StatefulWidget {
  final Map produto;

  const Produto({Key key, this.produto}) : super(key: key);
  @override
  _ProdutoState createState() => _ProdutoState();
}

class _ProdutoState extends State<Produto> {
  @override
  Widget build(BuildContext context) {
    String id = widget.produto['uid'];
    String name = widget.produto['name'];
    String description = widget.produto['description'];
    int price = widget.produto['price'];
    return Center(
      child: Container(
          child: Column(
            children: <Widget>[
              Column(
                children: [
                FlatButton(
                  child: Hero( 
                    child: CachedNetworkImage(
                      imageUrl: 'https://de-lyrios-backend.herokuapp.com/images/$id.png', 
                      width: 140,
                      height: 140,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    tag: id
                  ),
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ProdutoPage(tag: id, description: description, price: price)
                    ));
                  },
                ),
                Text('$name'),
                ]
              )
            ]
          )
        )
      );
  }
}