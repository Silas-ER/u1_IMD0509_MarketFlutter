import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/compra.dart';
import '../models/produto.dart';
import '../models/usuario.dart';

class CompraPage extends StatefulWidget {
  List<Produto>? produtos;
  Usuario? usuario;

  CompraPage({super.key, this.produtos, this.usuario});

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
        produto: produto,
        usuario: widget.usuario!,
        idVendedor: 1,
        quantidade: 1
      );
      compras.add(compra);
    });
    Navigator.pushReplacementNamed(context, "/compras", arguments: compras);
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> objects = ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    widget.produtos = objects[0];
    widget.usuario = objects[1];
    _calculoTotalCarrinho();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Finalizar compra"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10
              ),
            child: Text("Produtos: ", style: TextStyle(fontSize: 20),),
          ),
          SizedBox(
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
                            const Padding(padding: EdgeInsets.all(5)),
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
                                    icon: const Icon(Icons.delete)
                                )
                            )
                          ],
                        )
                    ),
                  );
                }
            ),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.all(15),
            child: Text("Total da compra: R\$ $totalCarrinho", style: TextStyle(fontSize: 20),),
          ),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton(
                onPressed: _efetuarCompra,
                child: const Text("COMPRAR")
            ),
          )
        ],
      ),
    );
  }
}