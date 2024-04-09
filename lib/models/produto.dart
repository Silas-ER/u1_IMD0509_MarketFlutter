import 'package:u1_project/models/vendedor.dart';

class Produto {
  int id;
  String nome;
  double preco;
  String descricao;
  String imagemUrl;
  Vendedor vendedor;

  Produto({
    required this.id,
    required this.nome,
    required this.preco,
    required this.descricao,
    required this.imagemUrl,
    required this.vendedor
  });
}