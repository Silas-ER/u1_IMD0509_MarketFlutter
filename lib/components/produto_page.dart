import 'package:flutter/material.dart';
import '../models/produto.dart';

class ProdutoPage extends StatelessWidget {
  final Produto produto;

  ProdutoPage({required this.produto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(produto.nome),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Image.asset(
                produto.imagemUrl,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                produto.nome,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                produto.descricao,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'R\$ ${produto.preco.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ],
        ),
      ),
      // Botão Carrinho
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}