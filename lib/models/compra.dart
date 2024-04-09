import 'package:u1_project/models/produto.dart';
import 'package:u1_project/models/usuario.dart';

class Compra {
  int id;
  Produto produto;
  int quantidade;
  int idVendedor;
  Usuario usuario;

  Compra({
    required this.id,
    required this.produto,
    required this.quantidade,
    required this.idVendedor,
    required this.usuario,
  });
}