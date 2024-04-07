import 'package:flutter/material.dart';
import '../models/produto.dart';

class ProdutoPage extends StatefulWidget {
  final Produto produto;
  Function(Produto) addCarrinho;

  ProdutoPage({required this.produto, required this.addCarrinho});

  State<ProdutoPage> createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produto.nome),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Image.asset(
                widget.produto.imagemUrl,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                widget.produto.nome,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.produto.descricao,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'R\$ ${widget.produto.preco.toStringAsFixed(2)}',
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
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:
            Text("Produto adicionado")
          ));
          widget.addCarrinho(widget.produto);
        },
        child: const Icon(Icons.add_shopping_cart),
      ),
    );
  }
}