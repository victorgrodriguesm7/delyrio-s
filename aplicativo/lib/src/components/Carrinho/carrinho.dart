import 'package:aplicativo/src/components/Carrinho/carrinhoController.dart';
import 'package:aplicativo/src/components/Carrinho/carrinhoRepository.dart';
import 'package:aplicativo/src/components/ProdutoCarrinho/produtoCarrinho.dart';
import 'package:flutter/material.dart';

class Carrinho extends StatefulWidget {
  final Map<String, dynamic> carrinho;
  final String uid;
  final Function sucess;
  final Function delete;
  const Carrinho({Key key, this.carrinho, this.uid, this.sucess, this.delete}) : super(key: key);
  @override
  _CarrinhoState createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  Map<String, dynamic> carrinho;
  @override
  void dispose() {
    super.dispose();
  }
  reload(index){
    print(widget.carrinho);
    setState(() {
      carrinho = widget.carrinho;
    });
  }
  List<Widget> lista;
  bool cancelled;
  bool isSucess;
  final CarrinhoController controller = CarrinhoController(CarrinhoRepository());
  TextEditingController address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> carrinho = widget.carrinho;
    if (lista == null) {
      List<Widget> tmp = [];
      for (var i = 0; i < carrinho['items'].length; i++) {
        var uid = carrinho['items'][i];
        var amount = carrinho['amount'][i];
        var price = carrinho['price'][i];
        var name = carrinho['name'][i];

        tmp.add(ProdutoCarrinho(
          delete: widget.delete, 
          name: name, 
          price: price, 
          amount: amount,
          uid: uid, 
          index: i,
          reload: reload
        ));
      }
      tmp.add(RaisedButton(
       onPressed: () async {
         await showDialog<String>(
      context: context,

      child: _SystemPadding(child: AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: address,
                autofocus: true,
                decoration: InputDecoration(
                    labelText: 'Digite seu endereço para nós finalizamos sua compra ', hintText: 'ex. Castelo branco N°69'),
              ),
            )
          ],
        ),
        actions: <Widget>[
          FlatButton(
              child: const Text('CANCEL'),
              onPressed: () {
                cancelled = true;
                Navigator.pop(context);
              }),
          FlatButton(
              child: const Text('Confirma'),
              onPressed: () {
                cancelled = false;
                Navigator.pop(context);
              })
        ],
      ),),
    );
      if(cancelled){
        return;
      }
      isSucess = await controller.realizarPedido(carrinho["items"],carrinho["amount"], address.text,widget.uid);     
      if(isSucess){
        
        await showDialog<String>(
          context: context,
          child: AlertDialog(
            title: Text("Pedido Realizado com Sucesso"),
            content: Text("Obrigado pela preferência"),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: (){Navigator.pop(context);},
              )
            ],
          )
        );
        widget.sucess();
      }else{
        await showDialog<String>(
          context: context,
          child: AlertDialog(
            title: Text("Error"),
            content: Text("Ocorreu um problema na hora de finalizar o pedido"),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: (){Navigator.pop(context);},
              )
            ],
          )
        );
      }
      
       },
                                 
     shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
     side: BorderSide(color: Colors.yellow) ),
   color:Colors.orangeAccent ,
     child: Text("Finalizar comprar"),
       ),
                              );
      setState(() {
        lista = tmp;
      });
    } else {
      return Container();
    }
    return SingleChildScrollView(
        child: Column(
      children: lista,
    ));
  }
}
class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(
        padding: mediaQuery.viewInsets,
        duration: const Duration(milliseconds: 300),
        child: child);
  }
}