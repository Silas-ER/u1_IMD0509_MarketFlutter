import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/produto.dart';
import '../models/usuario.dart';

class CarrinhoPage extends StatefulWidget {
  List<Produto> produtos;
  Usuario? usuario;
  Function(Produto) deleteCarrinho;
  CarrinhoPage({super.key, required this.produtos, required this.deleteCarrinho, this.usuario});

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  double totalCarrinho = 0;

  _calculoTotalCarrinho(){
    double total = 0;
    for(int i = 0; widget.produtos.length > i; i++) {
      total += widget.produtos[i].preco;
    }
    setState(() {
      totalCarrinho = total;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Produto> produtosCarrinho = widget.produtos;

    _calculoTotalCarrinho();
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Text("Carrinho: ", style: TextStyle(fontSize: 20),),
          ),
          Expanded(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: produtosCarrinho.length,
                    itemBuilder: (_, index) {
                      return Card(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20
                          ),
                          child: Row(
                            children: [
                              Image.asset(produtosCarrinho[index].imagemUrl, width: 50,),
                              const Padding(padding: EdgeInsets.all(5)),
                              Expanded(
                                child: SizedBox(
                                  width: double.infinity,
                                      child: Text(produtosCarrinho[index].descricao)
                                  ),
                              ),
                              SizedBox(
                                width: 40,
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        produtosCarrinho.remove(produtosCarrinho[index]);
                                      });
                                    },
                                    icon: const Icon(Icons.delete)
                                )
                              )
                            ],
                          )
                        ),
                      );
                    }
                ),
              )
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10
            ),
            color: Colors.grey,
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10
                  ),
                  child: Column(
                    children: [
                      const Text("Total da compra:"),
                      Text("R\$ $totalCarrinho"),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30
                      ),
                      child: (produtosCarrinho.isNotEmpty) ?
                      ElevatedButton(
                          onPressed: () {
                              List<dynamic> parametros = [
                                produtosCarrinho,
                                widget.usuario
                              ];
                              Navigator.pushReplacementNamed(context, "/finalizarCompra", arguments: parametros);
                          },
                          child: const Text("FINALIZAR COMPRA"))
                          :
                        null
                    )
                )
              ],
            )
          )
        ],
      ),
    );
  }
}