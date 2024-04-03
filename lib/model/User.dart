class User {

  final String fullName;
  final String email;
  final String password;

  User(this.fullName, this.email, this.password);

  //geração de uma lista dinâmica de contatos
  static List<User> gerarLista() {
    List<User> lista = [];
    for (int i = 1; i <= 1; i++) {
      lista.add(User('João da Silva', 'joao@email.com', '123'));
      lista.add(User('José Antônio', 'jose@email.com', '123'));
      lista.add(User('Ana Maria', 'joao@email.com', '123'));
      lista.add(User('Carla Fernanda', 'joao@email.com', 'Teste123'));
    }
    return lista;
  }

}