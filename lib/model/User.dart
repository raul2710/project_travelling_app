import 'Trip.dart';

class User {

  final String fullName;
  final String email;
  final String password;
  final List<Trip> listTrips;

  User(this.fullName, this.email, this.password, this.listTrips);
  
  //geração de uma lista dinâmica de contatos
  static List<User> loadUserList() {
    List<User> listUser = [];

    List<Trip> listTrips = Trip.loadTravelList();

    listUser.add(User('João da Silva', 'joao@email.com', '123', listTrips));
    listUser.add(User('José Antônio', 'jose@email.com', '123', listTrips));
    listUser.add(User('Ana Maria', 'joao@email.com', '123', listTrips));
    listUser.add(User('Carla Fernanda', 'joao@email.com', 'Teste123', listTrips));
    
    return listUser;
  }

}