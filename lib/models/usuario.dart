class Usuario {
  int id;
  String name;
  String email;
  String password;
  int? idCarrinho;

  Usuario({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.idCarrinho
  });
}