import 'package:flutter/material.dart';

class ProdutoCarrinho extends StatelessWidget {
  final Function delete;
  final String name;
  final int price;
  final int amount;
  final String uid;
  final int index;
  final Function reload;
  const ProdutoCarrinho({Key key, this.delete, this.name, this.price, this.amount, this.index, this.uid, this.reload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              padding: EdgeInsets.all(10),
              height: height * 0.25,
              width: width,
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: Colors.black12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.25,
                    width: width * 0.5,
                    child: Image.network(
                      'https://de-lyrios-backend.herokuapp.com/images/$uid.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(" $name "),
                        Text("R\$ $price reais"),
                        Text("Unidades: $amount"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.delete), 
                          onPressed: (){
                            delete(index);
                            reload(index);
                          }
                        )
                      ],
                    ),
                  ),
                ],
              )),
        );
  }
}