import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/Trip.dart';
import '../model/TripCategory.dart';

class ScreenListCategory extends StatefulWidget {
  const ScreenListCategory({super.key});
  // Declare a field that holds the Todo.
  
  @override
  State<ScreenListCategory> createState() => _ScreenListCategoryState();
}

class _ScreenListCategoryState extends State<ScreenListCategory> {
  
  var formKey = GlobalKey<FormState>();
  List<Trip> listTripsEmpty = [];
  List<TripCategory> listTripCategory = [];

  var txtCategoryName = TextEditingController();
  var txtCategoryDescription = TextEditingController();

  Future openDialog()=> showDialog(
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
            List<Trip> listTravels = [];
            TripCategory tripCategory = TripCategory(txtCategoryName.text, txtCategoryDescription.text, listTravels);

            listTripCategory.add(tripCategory);
            
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

  ListView showCategories(List<TripCategory> txtCategoryName){
    return ListView.builder(
        //Quantidade de itens
        itemCount: txtCategoryName.length,
        //Aparência de cada item
        itemBuilder: (context, index) {
          return Card(
            
            color: Colors.blue.shade50,
            child: ListTile (
                leading: Icon(Icons.card_travel_rounded),
                title: Text(txtCategoryName[index].name),
                subtitle: Text(txtCategoryName[index].description),
                
                hoverColor: Colors.red.shade50,

                //pressionar um item da txtCategoryName
                onTap: () {
                  Navigator.pushNamed(
                    context, 
                    'screenListTravels',
                    arguments: listTripCategory[index].listTravels,
                  );
                },
                //remover um item da txtCategoryName
                onLongPress: () {
                  setState(() {
                    txtCategoryName.removeAt(index);
                  });
                },
              ),
          );
        }
      );
  }
  @override
  Widget build(BuildContext context) {
    
    listTripCategory = ModalRoute.of(context)!.settings.arguments as List<TripCategory>;

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade100,
        title: Text('Your Travels'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Função para adicionar novo item
              Navigator.pushNamed(
                context, 
                'screenSearchTripCategory', 
                arguments: listTripCategory,
              );
            },
          ),
      ]),
      body: Padding(
        padding: EdgeInsets.all(20),
        //
        // ListView
        //listTripCategory
        child: showCategories(listTripCategory),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          txtCategoryDescription.text = '';
          txtCategoryName.text = '';
          openDialog();
        },
        
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 29, 165, 33),
              ),
              child: Text(
                  'Travelling App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                Navigator.pushNamed(context, 'screenAbout');
              },
            ),
          ],
        ),
      ),
    );
  }
}