import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/compra.dart';
import '../models/produto.dart';

class ListaComprasPage extends StatefulWidget {
  List<Compra>? compras;

  ListaComprasPage({super.key, this.compras});

  @override
  State<ListaComprasPage> createState() => _ListaComprasPageState();
}

class _ListaComprasPageState extends State<ListaComprasPage> {

  @override
  Widget build(BuildContext context) {
    widget.compras = ModalRoute.of(context)!.settings.arguments as List<Compra>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Suas compras:"),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
          itemCount: widget.compras!.length,
            itemBuilder: (_, index) {
              return Card(
                child: Container(
                  width: double.infinity,
                  height: 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Image.asset(widget.compras![index].produto.imagemUrl)
                      ),
                      Expanded(
                          child: Column(
                            children: [
                              Text("Produto: \n ${widget.compras![index].produto.nome}"),
                              Divider(),
                              Text("Vendedor: \n ${widget.compras![index].produto.vendedor.nomeLoja}"),
                            ],
                          )
                      ),
                      Container(
                        width: 100,
                        height: double.infinity,
                        child: Column(
                          children: [
                            Text("Quantidade: \n ${widget.compras![index].quantidade}"),
                            Divider(),
                            Text("Valor total: \n ${widget.compras![index].produto.preco}"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}