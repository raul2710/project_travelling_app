import 'package:flutter/material.dart';
import 'package:project_travelling_shop/model/User.dart';

import '../model/Trip.dart';
import '../model/User.dart';

class ScreenListTravels extends StatefulWidget {
  const ScreenListTravels({super.key});

  @override
  State<ScreenListTravels> createState() => _ScreenListTravelsState();
}

class _ScreenListTravelsState extends State<ScreenListTravels> {
  //declaração da lista dinâmica de user
  List<Trip> lista = [];

  @override
  void initState() {
    lista = Trip.loadTravelList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose your travel'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        //
        // ListView
        //
        child: ListView.builder(
          //Quantidade de itens
          itemCount: lista.length,
          //Aparência de cada item
          itemBuilder: (context, index) {
            return Card(
              color: Colors.blue.shade50,
              
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(lista[index].travelName),
                subtitle: Text(lista[index].description),

                hoverColor: Colors.red.shade50,
                //pressionar um item da lista
                onTap: () {
                  Navigator.pushNamed(context, 'screenModifyItem');
                },
                //remover um item da lista
                onLongPress: () {
                  setState(() {
                    lista.removeAt(index);
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}