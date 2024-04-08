class Trip {

  int id;
  String travelName;
  String place;
  double price;
  String description;
  bool   isChecked;

  Trip(this.id, this.travelName, this.place, this.price, this.description, this.isChecked);

  static List<Trip> loadTravelList() {
    List<Trip> lista = [];
    for (int i = 1; i <= 1; i++) {
      lista.add(Trip(1, 'Aurora boral', 'No', 10000.00, 'The first travelling of year', false));
      lista.add(Trip(2, 'Cancum travelling', 'Cancun', 123400.00, 'Is a nice travel', false));
      lista.add(Trip(3, 'Brazil Camping', 'Brazil', 10034.00, 'Yes it is', false));
      lista.add(Trip(4, 'Trip German', 'German', 12650.00, 'Allright is does it work', false));
    }
    return lista;
  }
}