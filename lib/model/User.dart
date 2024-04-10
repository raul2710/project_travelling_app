import 'Trip.dart';
import 'TripCategory.dart';

class User {

  final String fullName;
  final String email;
  final String password;
  final List<TripCategory> listTripCategory;

  User(this.fullName, this.email, this.password, this.listTripCategory);
  
  //geração de uma lista dinâmica de contatos
  static List<User> loadUserList() {
    List<User> listUser = [];

    List<TripCategory> listTripCategoryNotEmpty = TripCategory.loadTripCategoryList();
    List<TripCategory> listTripCategoryEmpty = [];

    listUser.add(User('João da Silva', '123@email.com', '123', listTripCategoryNotEmpty));
    listUser.add(User('José Antônio', 'teste@email.com', '123', listTripCategoryNotEmpty));
    listUser.add(User('Ana Maria', 'joaquim@email.com', '123', listTripCategoryNotEmpty));
    listUser.add(User('Carla Fernanda', 'regis@email.com', 'Teste123', listTripCategoryNotEmpty));
    listUser.add(User('Carla Fernanda', '234', '234', listTripCategoryEmpty));
    listUser.add(User('123', '123', '123', listTripCategoryNotEmpty));
    
    return listUser;
  }

}