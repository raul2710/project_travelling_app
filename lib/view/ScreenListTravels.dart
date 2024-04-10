import 'package:flutter/material.dart';
import 'package:project_travelling_shop/model/User.dart';

import '../model/Trip.dart';

class ScreenListTravels extends StatefulWidget {
  const ScreenListTravels({super.key});
  
  @override
  State<ScreenListTravels> createState() => _ScreenListTravelsState();
}

class _ScreenListTravelsState extends State<ScreenListTravels> {
  //declaração da listTravels dinâmica de user
  List<Trip> listTravels = [];
  bool checkboxValue1 = true;
  bool isEdit = true;

  @override
  void initState() {  
    super.initState();
  }

  ListView ListEditOrChecked (bool isEdit, List<Trip> listTravel) {
    // Modify the list if the user will check or editing
    if (isEdit){
      return ListView.builder(
        //Quantidade de itens
        itemCount: listTravels.length,
        //Aparência de cada item
        itemBuilder: (context, index) {
          return Card(
            
            color: Colors.blue.shade50,
            child: ListTile (
                leading: Icon(Icons.card_travel_rounded),
                title: Text(listTravels[index].travelName),
                subtitle: Text(listTravels[index].description),

                hoverColor: Colors.red.shade50,

                //pressionar um item da listTravels
                onTap: () {
                  Navigator.pushNamed(
                    context, 
                    'screenModifyItem',
                    arguments: listTravels[index],
                  );
                },
                //remover um item da listTravels
                onLongPress: () {
                  setState(() {
                    listTravels.removeAt(index);
                  });
                },
              ),
          );
        }
      );      

    }else {
      return ListView.builder(
        //Quantidade de itens
        itemCount: listTravels.length,
        //Aparência de cada item
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blue.shade50,
            child: CheckboxListTile (
              secondary: Icon(Icons.card_travel_rounded),
              title: Text(listTravels[index].travelName),
              subtitle: Text(listTravels[index].description),

              hoverColor: Colors.red.shade50, 
              value: listTravels[index].isChecked, 
              onChanged: (bool? value) { setState(() {
                  listTravels[index].isChecked = !listTravels[index].isChecked;

                }); 
              },
              //pressionar um item da listTravels
              
            ),
          );
        } 
      );  
    }
 
  }
  @override
  Widget build(BuildContext context) {
    
    listTravels = ModalRoute.of(context)!.settings.arguments as List<Trip>;
  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: Text('Your Travels'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Função para adicionar novo item
              Navigator.pushNamed(
                context, 
                'screenSearchTrip', 
                arguments: listTravels,
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.check),
            onPressed:  (){
              setState(() {
                isEdit = !isEdit;
              });
            }, 

          ),   
      ]),
      body: Padding(
        padding: EdgeInsets.all(20),
        //
        // ListView
        //
        child: ListEditOrChecked(isEdit, listTravels),
      ),
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