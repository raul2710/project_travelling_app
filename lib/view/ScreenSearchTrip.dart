import 'package:flutter/material.dart';
import 'package:project_travelling_shop/model/Trip.dart';

class ScreenSearchTrip extends StatefulWidget {
  const ScreenSearchTrip({Key? key}) : super(key: key);

  @override
  createState() => _ScreenSearchTripState();
}

class _ScreenSearchTripState extends State<ScreenSearchTrip> {
  // Declaração da listTravels dinâmica de user
  final TextEditingController txtInputSearch = TextEditingController();

  bool checkboxValue1 = true;
  bool isEdit = true;
  
  List<Trip> searchResults = [];
  List<Trip> listTravels = [];

  void onQueryChanged(String query) {
    setState(() {
      listTravels = ModalRoute.of(context)!.settings.arguments as List<Trip>;
      searchResults = listTravels
        .where((item) => item.travelName.toLowerCase().contains(query.toLowerCase()))
        .toList();
      }
    );
  }

  @override
  void initState() {  
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    listTravels = ModalRoute.of(context)!.settings.arguments as List<Trip>;
    onQueryChanged(txtInputSearch.text);
    
    return Scaffold(
      appBar:AppBar(
        title: Container(
            //height: 40,
            decoration: BoxDecoration(
                color: const Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(5)),
            child: TextField(
              autofocus: true,
              controller: txtInputSearch,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: Icon(
                    Icons.search_rounded,
                  ),
                  onPressed: () => FocusScope.of(context).unfocus(),
                ),
                suffixIcon: IconButton(
                    icon: Icon(
                      Icons.clear_rounded,
                    ),
                    onPressed: () {
                      txtInputSearch.text = "";
                      onQueryChanged(txtInputSearch.text);
                    }),
                hintText: 'Search...',
                border: InputBorder.none,
              ),
              onChanged: (value) => onQueryChanged(txtInputSearch.text),
              onSubmitted: (value) => onQueryChanged(txtInputSearch.text),
            ),
          ),
        ),
        //
        // ListView
        //
        body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          // controller: _scrollController,
          itemCount: searchResults.length,
          shrinkWrap: true,
          padding: const EdgeInsets.only(bottom: 10),
          itemBuilder: (context, index) {
            return Card(
              color: Colors.blue.shade50,
              child: ListTile (
                  leading: Icon(Icons.card_travel_rounded),
                  title: Text(searchResults[index].travelName),
                  subtitle: Text(searchResults[index].description),

                  hoverColor: Colors.red.shade50,

                  //pressionar um item da searchResults
                  onTap: () {
                    Navigator.pushNamed(
                      context, 
                      'screenModifyItem',
                      arguments: searchResults[index],
                    );
                  },
                  //remover um item da searchResults
                  onLongPress: () {
                    setState(() {
                      listTravels.removeAt(index);
                      onQueryChanged(txtInputSearch.text);
                    });
                  },
                ),
            );
          }
          ),
        
      ),

        //child: ListEditOrChecked(isEdit, listTravels),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context, 
            'screenAddTrip', 
            arguments: listTravels,
          );
        },
        
        child: const Icon(Icons.add),
      ),
    );
  }
}