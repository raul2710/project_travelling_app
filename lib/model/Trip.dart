class Trip {

  final int id;
  final String travelName;
  final String place;
  final double price;
  final String description;

  Trip(this.id, this.travelName, this.place, this.price, this.description);

  static List<Trip> loadTravelList() {
    List<Trip> lista = [];
    for (int i = 1; i <= 1; i++) {
      lista.add(Trip(1, 'Aurora boral', 'No', 10000.00, 'The first travelling of year'));
      lista.add(Trip(2, 'Cancum travelling', 'Cancun', 123400.00, 'Is a nice travel'));
      lista.add(Trip(3, 'Brazil Camping', 'Brazil', 10034.00, 'Yes it is'));
      lista.add(Trip(4, 'Trip German', 'German', 12650.00, 'Allright is does it work'));
    }
    return lista;
  }
}