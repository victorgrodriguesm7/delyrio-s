import 'package:aplicativo/src/Pages/Login/loginPage.dart';
import 'package:aplicativo/src/components/Carrinho/carrinho.dart';
import 'package:aplicativo/src/components/Produto/produto.dart';
import 'package:aplicativo/src/core/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  final User user;
  HomePage(this.user);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List listaProdutos;
  var response;
  Map<String, dynamic> carrinho = {"items": [], "amount": [], "price": [], "name": []};
  cardapio() async {
    response =
        await http.get('https://de-lyrios-backend.herokuapp.com/cardapio');
    setState(() {
      listaProdutos = json.decode(response.body);
    });
  }

  adicionarItem(produto) {
    if (carrinho['items'].contains(produto['uid'])) {
      var index = carrinho['items'].indexOf(produto['uid']);
      print(index);
      setState(() {
        carrinho['amount'][index] = carrinho['amount'][index] + 1;
      });
    } else {
      setState(() {
        carrinho['items'].add(produto['uid']);
        carrinho['amount'].add(1);
        carrinho['price'].add(produto['price']);
        carrinho['name'].add(produto['name']);
      });
    }
    print(carrinho);
  }

  @override
  Widget build(BuildContext context) {
    if (listaProdutos == null){  
      cardapio();
      return Container();
    }
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: DefaultTabController(
          length: 2,
          child: Scaffold(
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  ListTile(
              leading: Icon(Icons.trending_flat),
              onTap: () {
                Navigator.pop(context);
              },
            ),
               ListTile(
                  leading: Icon(Icons.person),
                  title: Text(widget.user.email),
               ),
               ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Configurações'),
                   ),
               ListTile(
                  leading: Icon(Icons.exit_to_app),
                  onTap:(){
                    Navigator.pushReplacement(
                      context, MaterialPageRoute(
                        builder: (_) => LoginPage()
                      )
                    );
                  },
                  title: Text('Sair'),
                   ),
                ]
               ),
            ),
            appBar: AppBar(
                centerTitle: true,
                actions: [
                  Image.network(
                    'https://de-lyrios-backend.herokuapp.com/images/Assets/logo.png',
                    width: width * 0.12,
                    height: height * 0.12,
                  )
                ],
                title: Text("De Lyrio's",
                    style:
                        TextStyle(color: Colors.yellow, fontSize: width * 0.1)),
                backgroundColor: Colors.redAccent),
            body: TabBarView(
              children: [
                Container(
                  color: Colors.white,
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(listaProdutos.length, (index) {
                      var produto = listaProdutos[index];
                      return Produto(
                          produto: produto,
                          funcao: () {
                            adicionarItem(produto);
                          });
                      }
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Carrinho(carrinho: carrinho)
                ),
              ],
            ),
            bottomNavigationBar: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.restaurant_menu),
                ),
                Tab(
                  icon: Icon(Icons.shopping_cart),
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