import 'package:flutter/material.dart';
import '../models/usuario.dart';
import 'registro_page.dart'; // Importe a página de registro

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Email'),
                controller: _emailController,
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(labelText: 'Senha'),
                controller: _senhaController,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_emailController.text=="usuarioDDM@gmail.com") {
                    if (_senhaController.text=="123456") {
                      Usuario usuario = Usuario(
                        id: 1,
                        name: "Usuário IMD",
                        email: "usuarioDDM@gmail.com",
                        password: '',
                      );
                      Navigator.pushReplacementNamed(context, "/home", arguments: usuario);
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:
                      Text("Email não encontrado")
                    ));
                  }
                },
                child: Text('Login'),
              ),
              TextButton(
                onPressed: () {
                  // Navegar para a página de registro quando clicado
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistroPage()),
                  );
                },
                child: Text('Não tem uma conta? Cadastre-se'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
