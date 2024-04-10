import 'Trip.dart';

class TripCategory {
  String name;
  String description;
  final List<Trip> ?listTravels;

  TripCategory(this.name, this.description, this.listTravels);

  static List<TripCategory> loadTripCategoryList() {
    List<TripCategory> listTripCategory = [];

    List<Trip> listTripsTest1 = Trip.loadTravelList();
    List<Trip> listTripsTest2 = Trip.loadTravelList();
    List<Trip> listTripsEmpty = [];
    
    listTripCategory.add(TripCategory('CheckedTeste1', 'Beautiful travels', listTripsTest1));
    listTripCategory.add(TripCategory('CheckedTeste2', 'Test travels', listTripsTest2));
    listTripCategory.add(TripCategory('CheckedTesteEmptyList', 'Yes its work', listTripsEmpty));
    
    return listTripCategory;
  }
}