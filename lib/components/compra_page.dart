import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Compra.dart';
import '../models/produto.dart';

class CompraPage extends StatefulWidget {
  List<Produto>? produtos;

  CompraPage({super.key, this.produtos});

  @override
  State<CompraPage> createState() => _CompraPageState();
}

class _CompraPageState extends State<CompraPage> {
  double totalCarrinho = 0;

  _calculoTotalCarrinho(){
    double total = 0;
    for(int i = 0; widget.produtos!.length > i; i++) {
      total += widget.produtos![i].preco;
    }
    setState(() {
      totalCarrinho = total;
    });
  }

  _efetuarCompra(){
    List<Compra> compras = [];
    widget.produtos?.forEach((produto) {
      Compra compra = Compra(
        id: 1,
        idProduto: produto.id,
        idCliente: 1,
        idVendedor: 1,
        quantidade: 1
      );
      compras.add(compra);
    });

  }

  @override
  Widget build(BuildContext context) {
    widget.produtos = ModalRoute.of(context)!.settings.arguments as List<Produto>;
    _calculoTotalCarrinho();

    return Scaffold(
      appBar: AppBar(
        title: Text("Finalizar compra"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10
              ),
            child: Text("Produtos: ", style: TextStyle(fontSize: 20),),
          ),
          Container(
            height: 150,
            child: ListView.builder(
                itemCount: widget.produtos?.length,
                itemBuilder: (_, index) {
                  return Card(
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20
                        ),
                        child: Row(
                          children: [
                            Image.asset(widget.produtos![index].imagemUrl, width: 50,),
                            Padding(padding: EdgeInsets.all(5)),
                            Expanded(
                              child: SizedBox(
                                  width: double.infinity,
                                  child: Text(widget.produtos![index].descricao)
                              ),
                            ),
                            SizedBox(
                                width: 40,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.delete)
                                )
                            )
                          ],
                        )
                    ),
                  );
                }
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.all(15),
            child: Text("Total da compra: R\$ $totalCarrinho", style: TextStyle(fontSize: 20),),
          ),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
                onPressed: _efetuarCompra,
                child: Text("COMPRAR")
            ),
          )
        ],
      ),
    );
  }
}