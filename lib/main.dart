import 'package:flutter/material.dart';
import 'models/produto.dart';

void main() => runApp(const MarketApp());

class MarketApp extends StatelessWidget {
  const MarketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      title: 'Flutter Marketplace',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
final List<Produto> produtos = [
  Produto(
      id: 1,
      nome: 'Projetor M9',
      preco: 29.99,
      descricao: 'Projetor portátil com resolução HD',
    ),
    Produto(
      id: 2,
      nome: 'Relogio Smart',
      preco: 59.99,
      descricao: 'Relógio inteligente com monitor de batimentos cardíacos',
    ),
    Produto(
      id: 3,
      nome: 'Smartphone M123',
      preco: 99.99,
      descricao: 'Smartphone com câmera tripla e 128GB de armazenamento',
    ),
    Produto(
      id: 4,
      nome: 'Headphone Bt',
      preco: 39.99,
      descricao: 'Headphone Bluetooth com microfone embutido',
    ),
    Produto(
      id: 5,
      nome: 'Tablet t5',
      preco: 19.99,
      descricao: 'Tablet com tela de 10 polegadas e 64GB de armazenamento',
    ),
    Produto(
      id: 6,
      nome: 'Camera Digital',
      preco: 79.99,
      descricao: 'Câmera digital com lente intercambiável',
    ),
    Produto(
      id: 7,
      nome: 'Smartphone M1',
      preco: 49.99,
      descricao: 'Smartphone com câmera tripla e 64GB de armazenamento',
    ),
    Produto(
      id: 8,
      nome: 'Notebook N1',
      preco: 29.99,
      descricao: 'Notebook com processador i5 e 8GB de RAM',
    ),
    Produto(
      id: 9,
      nome: 'Fone TWS',
      preco: 19.99,
      descricao: 'Fone de ouvido sem fio com estojo carregador',
    ),
    Produto(
      id: 10,
      nome: 'Tablet t3',
      preco: 9.99,
      descricao: 'Tablet com tela de 7 polegadas e 32GB de armazenamento',
    ),
    Produto(
      id: 11,
      nome: 'Smartphone M2',
      preco: 14.99,
      descricao: 'Smartphone com câmera dupla e 32GB de armazenamento',
    ),
    Produto(
      id: 12,
      nome: 'Smartwatch S1',
      preco: 9.99,
      descricao: 'Relógio inteligente com monitor de batimentos cardíacos',
    ),
    Produto(
      id: 13,
      nome: 'Notebook N25',
      preco: 19.99,
      descricao: 'Notebook com processador i3 e 4GB de RAM',
    ),
    Produto(
      id: 14,
      nome: 'Fone TWS 4',
      preco: 14.99,
      descricao: 'Fone de ouvido sem fio com estojo carregador',
    ),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Título App
        title: const Text('IMD SHOP', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.redAccent,
        // Botão Perfil
        actions: <Widget>[
          InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(100),
                ),
                margin: const EdgeInsets.only(right: 20),
                padding: const EdgeInsets.all(8),
                child: const Icon(Icons.person_outline, color: Colors.white),
              )
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                margin: const EdgeInsets.only(bottom: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/bannerHome.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Substituído GridView por Wrap
              Wrap(
                spacing: 20.0, // Espaçamento horizontal
                runSpacing: 20.0, // Espaçamento vertical
                children: [
                  for (var i = 0; i < 14; i++)
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 2 - 30, // Largura ajustada
                      child: Card(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset('assets/images/product$i.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                produtos[i].nome,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
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