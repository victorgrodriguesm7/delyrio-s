import 'package:aplicativo/src/components/Carrinho/carrinhoModel.dart';
import 'package:aplicativo/src/components/Carrinho/carrinhoRepository.dart';

class CarrinhoController {
  final CarrinhoRepository repository;
  CarrinhoController(this.repository);
  CarrinhoModel pedido = CarrinhoModel();
  Future<bool> realizarPedido(items, amount, address,uid) async {
    pedido.items = items;
    pedido.amount = amount;
    pedido.address = address;
    return await repository.doPedido(pedido,uid);
  }
}