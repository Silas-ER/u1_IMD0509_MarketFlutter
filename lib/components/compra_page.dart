import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/produto.dart';

class CompraPage extends StatefulWidget {
  List<Produto>? produtos;

  CompraPage({super.key, this.produtos});

  @override
  State<CompraPage> createState() => _CompraPageState();
}

class _CompraPageState extends State<CompraPage> {

  @override
  Widget build(BuildContext context) {
    widget.produtos = ModalRoute.of(context)!.settings.arguments as List<Produto>;

    return Scaffold(
      appBar: AppBar(
        title: Text("Finalizar compra"),
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
          Container(
            height: 150,
            child: Text("Endereço"),
          )
        ],
      ),
    );
  }
}