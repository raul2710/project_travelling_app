import 'package:flutter/material.dart';
import 'package:project_travelling_shop/model/Trip.dart';
import 'package:project_travelling_shop/model/TripCategory.dart';

class ScreenSearchTripCategory extends StatefulWidget {
  const ScreenSearchTripCategory({Key? key}) : super(key: key);

  @override
  createState() => _ScreenSearchTripCategoryState();
}

class _ScreenSearchTripCategoryState extends State<ScreenSearchTripCategory> {
  // Declaração da listTripCategory dinâmica de user
  final TextEditingController txtInputSearch = TextEditingController();
  final TextEditingController txtCategoryDescription = TextEditingController();
  final TextEditingController txtCategoryName = TextEditingController();

  bool checkboxValue1 = true;
  bool isEdit = true;
  
  List<TripCategory> searchResults = [];
  List<TripCategory> listTripCategory = [];

  @override
  void initState() {  
    super.initState();
    searchResults = listTripCategory;
    // txtInputSearch.text = '';
  }

  void onQueryChanged(String query) {
    setState(() {
      searchResults = listTripCategory
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
      }
    );
  }

  Future openDialog(TripCategory category)=> showDialog(
    context: context,
    builder: (context)=>AlertDialog(
      title: Text('Add a category'),
      scrollable: true,
      content: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(child: 
          
          Column(children: [
            TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: 'Name of travel'),
              controller: txtCategoryName,
          ),
          TextField(
              decoration: InputDecoration(hintText: 'Description of travel'),
              controller: txtCategoryDescription,
          ),
        ],),

          ),
          
        ),
      actions: [
        TextButton(
          onPressed: (){
            category.name = txtCategoryName.text;
            category.description = txtCategoryName.text;

            Navigator.of(context).pop();
          }, 
          child: Text('Save')),
        TextButton(
          onPressed: (){
            Navigator.of(context).pop();
          }, 
          child: Text('Back')),
      ],
    )
  );


  @override
  Widget build(BuildContext context) {
    listTripCategory = ModalRoute.of(context)!.settings.arguments as List<TripCategory>;
    
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
                  title: Text(searchResults[index].name),
                  subtitle: Text(searchResults[index].description),

                  hoverColor: Colors.red.shade50,

                  //pressionar um item da searchResults
                  onTap: () {
                    txtCategoryDescription.text = listTripCategory[index].description;
                    txtCategoryName.text = listTripCategory[index].name;
                    openDialog(listTripCategory[index]);
                  },
                  //remover um item da searchResults
                  onLongPress: () {
                    setState(() {
                      listTripCategory.removeAt(index);
                      onQueryChanged(txtInputSearch.text);
                    });
                  },
                ),
            );
          }
          ),
        
      ),

        //child: ListEditOrChecked(isEdit, listTripCategory),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context, 
            'screenAddTrip', 
            arguments: listTripCategory,
          );
        },
        
        child: const Icon(Icons.add),
      ),
    );
  }
}