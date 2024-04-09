import 'package:u1_project/models/produto.dart';

class Carrinho {
  int id;
  List<Produto> produtos;

  Carrinho({
    required this.id,
    required this.produtos
  });
}