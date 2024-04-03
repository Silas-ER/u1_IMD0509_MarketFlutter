import 'package:flutter/material.dart';

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
                            Text('Product $i'),
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