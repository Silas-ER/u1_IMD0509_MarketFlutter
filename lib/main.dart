import 'package:flutter/material.dart';
import 'package:u1_project/components/compra_page.dart';
import 'package:u1_project/components/exibir_carrinho.dart';
import 'package:u1_project/components/login_page.dart';
import 'models/produto.dart';
import 'components/login_page.dart';
import 'components/produto_page.dart';


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
      home: const HomePage(),
      routes: {
        "/home" : (context) => HomePage(),
        "/finalizarCompra" : (context) => CompraPage()
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Produto> produtos = [
    Produto(
      id: 1,
      nome: 'Projetor M9',
      preco: 29.99,
      descricao: 'Projetor portátil com resolução HD',
      imagemUrl: 'assets/images/product0.png',
    ),
    Produto(
      id: 2,
      nome: 'Relogio Smart',
      preco: 59.99,
      descricao: 'Relógio inteligente com monitor de batimentos cardíacos',
      imagemUrl: 'assets/images/product1.png',
    ),
    Produto(
      id: 3,
      nome: 'Smartphone M123',
      preco: 99.99,
      descricao: 'Smartphone com câmera tripla e 128GB de armazenamento',
      imagemUrl: 'assets/images/product2.png',
    ),
    Produto(
      id: 4,
      nome: 'Headphone Bt',
      preco: 39.99,
      descricao: 'Headphone Bluetooth com microfone embutido',
      imagemUrl: 'assets/images/product3.png',
    ),
    Produto(
      id: 5,
      nome: 'Tablet t5',
      preco: 19.99,
      descricao: 'Tablet com tela de 10 polegadas e 64GB de armazenamento',
      imagemUrl: 'assets/images/product4.png',
    ),
    Produto(
      id: 6,
      nome: 'Camera Digital',
      preco: 79.99,
      descricao: 'Câmera digital com lente intercambiável',
      imagemUrl: 'assets/images/product5.png',
    ),
    Produto(
      id: 7,
      nome: 'Smartphone M1',
      preco: 49.99,
      descricao: 'Smartphone com câmera tripla e 64GB de armazenamento',
      imagemUrl: 'assets/images/product6.png',
    ),
    Produto(
      id: 8,
      nome: 'Notebook N1',
      preco: 29.99,
      descricao: 'Notebook com processador i5 e 8GB de RAM',
      imagemUrl: 'assets/images/product7.png',
    ),
    Produto(
      id: 9,
      nome: 'Fone TWS',
      preco: 19.99,
      descricao: 'Fone de ouvido sem fio com estojo carregador',
      imagemUrl: 'assets/images/product8.png',
    ),
    Produto(
      id: 10,
      nome: 'Tablet t3',
      preco: 9.99,
      descricao: 'Tablet com tela de 7 polegadas e 32GB de armazenamento',
      imagemUrl: 'assets/images/product9.png',
    ),
    Produto(
      id: 11,
      nome: 'Smartphone M2',
      preco: 14.99,
      descricao: 'Smartphone com câmera dupla e 32GB de armazenamento',
      imagemUrl: 'assets/images/product10.png',
    ),
    Produto(
      id: 12,
      nome: 'Smartwatch S1',
      preco: 9.99,
      descricao: 'Relógio inteligente com monitor de batimentos cardíacos',
      imagemUrl: 'assets/images/product11.png',
    ),
    Produto(
      id: 13,
      nome: 'Notebook N25',
      preco: 19.99,
      descricao: 'Notebook com processador i3 e 4GB de RAM',
      imagemUrl: 'assets/images/product12.png',
    ),
    Produto(
      id: 14,
      nome: 'Fone TWS 4',
      preco: 14.99,
      descricao: 'Fone de ouvido sem fio com estojo carregador',
      imagemUrl: 'assets/images/product13.png',
    ),
  ];
  final List<Produto> produtosCarrinho = [];

  _openModalCarrinho(){
    showModalBottomSheet(
        context: context,
        builder:(_) {
          return CarrinhoPage(produtos: produtosCarrinho, deleteCarrinho: _deleteCarrinho,);
        }
    );
  }

  _deleteCarrinho(Produto produto){
    produtosCarrinho.remove(produto);
  }

  _addCarrinho(Produto produto) {
    produtosCarrinho.add(produto);
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
            onTap: () {
              // Navegar para a página de login quando o ícone for clicado
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(100),
              ),
              margin: const EdgeInsets.only(right: 20),
              padding: const EdgeInsets.all(8),
              child: const Icon(Icons.person_outline, color: Colors.white),
            ),
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
                      width: MediaQuery.of(context).size.width / 2 - 30, // Largura ajustada
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProdutoPage(produto: produtos[i], addCarrinho: _addCarrinho,)),
                          );
                        },
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
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
      // Botão Carrinho
      floatingActionButton: FloatingActionButton(
        onPressed: _openModalCarrinho,
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }

}