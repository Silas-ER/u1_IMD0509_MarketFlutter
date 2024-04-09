import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/produto.dart';

class ListaComprasPage extends StatefulWidget {
  List<Produto>? produtos;

  ListaComprasPage({super.key, this.produtos});

  @override
  State<ListaComprasPage> createState() => _ListaComprasPageState();
}

class _ListaComprasPageState extends State<ListaComprasPage> {

  @override
  Widget build(BuildContext context) {
    widget.produtos = ModalRoute.of(context)!.settings.arguments as List<Produto>;

    return Scaffold(
      appBar: AppBar(
        title: Text("Suas compras:"),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            color: Colors.red,
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
        ],
      ),
    );
  }
}