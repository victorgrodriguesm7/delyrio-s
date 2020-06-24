import 'package:aplicativo/src/components/Produto/produto.dart';
import 'package:aplicativo/src/core/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

var listaProdutos = [
  {
    "uid": "dac0f135",
    "name": "Arroz",
    "description": "Arroz comum",
    "price": 10
  },
  {
    "uid": "9a6e2af9",
    "name": "Feijoada",
    "description": "Feijoada comum",
    "price": 20
  },
  {
    "uid": "8268b6ca",
    "name": "Frango",
    "description": "Frango comum",
    "price": 15
  },
  {
    "uid": "b07ab5b6",
    "name": "Bife",
    "description": "Bife comum",
    "price": 20
  },
  {
    "uid": "afab45a3",
    "name": "Coca-Cola",
    "description": "Coca-Cola de 2L",
    "price": 8
  },
  {
    "uid": "9d5c6088",
    "name": "Sukita",
    "description": "Sukita 2L",
    "price": 5
  },
  {
    "uid": "6f1ad344",
    "name": "Frevo 2L",
    "description": "Pior Refri",
    "price": 1
  }
];

class HomePage extends StatefulWidget {
  final User user;
  HomePage(this.user);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List listaProdutos;
  var response;
  cardapio() async {
    response = await http.get('https://de-lyrios-backend.herokuapp.com/cardapio');
    print(response);
    print(json.decode(response.body));
    setState(() {
       listaProdutos = json.decode(response.body);
    });
   
  }
  @override
  Widget build(BuildContext context) {
    if (listaProdutos == null){  
      cardapio();
      return Container();
    }
    return SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            drawer: Drawer(),
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
                backgroundColor: Colors.redAccent),
            body: TabBarView(
              children: [
                Container(
                  color: Colors.white,
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(listaProdutos.length, (index) {
                      var produto = listaProdutos[index];
                      return Produto(produto: produto);              
                    }
                  ),
                  ),
                ),
                Container(
                  color: Colors.white,
                ),
              ],
            ),
            bottomNavigationBar: TabBar(
              tabs: [
                Tab(
                  icon:  Icon(Icons.restaurant_menu),
                ),
                Tab(
                  icon:  Icon(Icons.shopping_cart),
                ),
              ],
              labelColor: Colors.orange,
              unselectedLabelColor: Colors.red,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(5.0),
              indicatorColor: Colors.orange,
            ),
          )
        ),
    );
  }
}
