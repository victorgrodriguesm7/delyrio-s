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
  cardapio() async {
    response = await http.get('https://de-lyrios-backend.herokuapp.com/cardapio');
    setState(() {
       listaProdutos = json.decode(response.body);
    });
   
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                    width: width * 0.12,
                    height: height * 0.12,
                  )
                ],
                title: Text("De Lyrio's",
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
