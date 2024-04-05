import 'package:flutter/material.dart';
import 'package:project_travelling_shop/model/User.dart';

import '../model/Trip.dart';
import '../model/User.dart';

class ScreenListTravels extends StatefulWidget {
  //final List<User> listUsers;
  const ScreenListTravels({super.key, /*required this.listUsers*/});
  
  @override
  State<ScreenListTravels> createState() => _ScreenListTravelsState();
}

class _ScreenListTravelsState extends State<ScreenListTravels> {
  //declaração da listTravels dinâmica de user
  List<Trip> listTravels = [];

  @override
  void initState() {  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    User user = ModalRoute.of(context)!.settings.arguments as User;
    listTravels = user.listTrips;

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
          itemCount: listTravels.length,
          //Aparência de cada item
          itemBuilder: (context, index) {
            return Card(
              color: Colors.blue.shade50,
              
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(listTravels[index].travelName),
                subtitle: Text(listTravels[index].description),

                hoverColor: Colors.red.shade50,
                //pressionar um item da listTravels
                onTap: () {
                  var teste = [user, listTravels[index]];
                  // Navigator.byName(name).pushNamed(
                  //   context, 
                  //   'screenModifyItem',
                  //   arguments: listTravels[index],
                  // );
                   
                },
                //remover um item da listTravels
                onLongPress: () {
                  setState(() {
                    listTravels.removeAt(index);
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